//
//  MessageModel.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/27/20.
//

import Foundation
import MessageKit

struct Message: MessageType, Equatable {
    public var sender: SenderType
    public var messageId: String
    public var sentDate: Date
    public var kind: MessageKind
    
    static func == (lhs: Message, rhs: Message) -> Bool {
      return lhs.sentDate == rhs.sentDate
    }
}

struct Sender: SenderType {
    public var senderId: String
    public var displayName: String
}
