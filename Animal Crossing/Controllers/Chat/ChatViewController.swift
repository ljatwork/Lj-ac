//
//  ChatViewController.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/27/20.
//

import Foundation
import MessageKit
import InputBarAccessoryView

class ChatViewController: MessagesViewController {
    var messages: [Message] = []
    var ownSender: Sender?
    deinit {
        debugPrint("ChatViewController deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPubnub()
        setupSender()
    }
    
    override func loadView() {
        super.loadView()
        setBackgroud()
        setupNavView()
        setupInputBar()
        setupCollectionView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        messageInputBar.inputTextView.becomeFirstResponder()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        PubNubManager.shared.unsubscribeToChannel()
    }
    
    func setupCollectionView() {
        messageInputBar.delegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.backgroundColor = .clear
        if let layout = messagesCollectionView.collectionViewLayout as? MessagesCollectionViewFlowLayout {
          layout.setMessageIncomingAvatarSize(.zero)
          layout.setMessageOutgoingAvatarSize(.zero)
        }
    }
    
    func setupInputBar() {
        messageInputBar.sendButton.backgroundColor = UIColor(hexString: ColorHex.hex13.rawValue)
        messageInputBar.sendButton.setTitleColor(.white, for: .normal)
        ACUtils.applyRoundedCorners(view: messageInputBar.sendButton, cornerRadius: 8)
        messageInputBar.inputTextView.placeholder = L10n.startANewMessage
    }
    
    func setupSender() {
        let username = UserDefaults.standard.getUsername()
        ownSender = Sender(senderId: username, displayName: username)
    }
    
    func setupPubnub() {
        addListeners()
        PubNubManager.shared.subscribeToChannel()
    }
    
}
