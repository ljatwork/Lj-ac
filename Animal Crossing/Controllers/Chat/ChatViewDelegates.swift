//
//  ChatViewDelegates.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/27/20.
//

import Foundation
import MessageKit
import InputBarAccessoryView
import PubNub

extension ChatViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    func currentSender() -> SenderType {
        if let sender = ownSender {
            return sender
        }
        return Sender(senderId: "", displayName: "")
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return UIColor(hexString: ColorHex.hex5.rawValue)
    }

    func shouldDisplayHeader(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> Bool {
        return false
    }

    func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        let corner: MessageStyle.TailCorner = isFromCurrentSender(message: message) ? .bottomRight : .bottomLeft
       
        return .bubbleTail(corner, .pointedEdge)
    }
    
    func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return .white
    }
    
    func avatarSize(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return .zero
    }

    func footerViewSize(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return CGSize(width: 0, height: 8)
    }

    func heightForLocation(message: MessageType, at indexPath: IndexPath, with maxWidth: CGFloat, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 0
    }

    func numberOfMessages(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {

        return messages[indexPath.section]
    }
    
    // used for showing the name of the sender
    func messageBottomLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        let sender =  messages[indexPath.section].sender
        let style = NSMutableParagraphStyle()
        style.alignment = sender.senderId == UserDefaults.standard.getUsername() ? .right : .left
        let bottomAttribute: [NSAttributedString.Key: Any] = [
            .font : ACUtils.defaultAppFont(fontSize: 10),
            .foregroundColor: UIColor.init(hexString: "666666"),
            .paragraphStyle: style]
        return NSAttributedString(string: messages[indexPath.section].sender.displayName, attributes: bottomAttribute)
    }
    
    func messageBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 10
    }

    func cellTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {

        let name = message.sender.displayName
        return NSAttributedString(string: name,
                                  attributes: [
                                    .font: ACUtils.defaultAppFont(fontSize: 14),
                                    .foregroundColor: UIColor(white: 0.3, alpha: 1)])
    }
}


extension ChatViewController: InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        }
        messageInputBar.inputTextView.text = ""
        PubNubManager.shared.publishMessage(text)
    }
    
    func insertNewMessage(_ message: Message) {
        guard !messages.contains(message) else {
            return
        }
        messages.append(message)
        messagesCollectionView.reloadDataAndKeepOffset()
        if messages.firstIndex(of: message) == (messages.count - 1) {
            messagesCollectionView.scrollToBottom()
        }
    }
    
    // create message ID using date and random numbers
    private func createMessageID() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy_HH-mm"
        let newDate = dateFormatter.string(from: Date())
        let number = Int.random(in: 0...1000)
        return newDate + "_\(number)"
    }
    
    // - Add listener event callbacks
    func addListeners() {
        PubNubManager.shared.listener.didReceiveSubscription = { [weak self] event in
            guard let self = `self` else { return }
            switch event {
            case let .messageReceived(message):
                debugPrint("Message Received: \(message) Publisher: \(message.publisher ?? "defaultUUID")")
                self.setupMessage(message)
                break
            case let .connectionStatusChanged(status):
                debugPrint("Status Received: \(status)")
                break
            case let .presenceChanged(presence):
                debugPrint("Presence Received: \(presence)")
                break
            case let .subscribeError(error):
                debugPrint("Subscription Error \(error)")
                break
            default:
                break
            }
        }
        
        // Start receiving subscription events
        PubNubManager.shared.client.add(PubNubManager.shared.listener)
    }
    
    func setupMessage(_ msg: PubNubMessage) {
        let sender = Sender(senderId: msg.publisher!, displayName: msg.publisher!)
        let message = Message(sender: sender, messageId: createMessageID(), sentDate: msg.published.timetokenDate, kind: .text("\(msg.payload)"))
        insertNewMessage(message)
    }
    
}
