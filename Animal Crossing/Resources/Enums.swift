//
//  Enums.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/19/20.
//

import Foundation
import MessageKit
import UIKit

// Default app font weight
enum FontWeight: String {
    case bold = "-Bold"
    case regular = ""
    case italic = "-Italic"
    case boldItalic = "-BoldItalic"
}

enum Menu: String {
    case friends = "friends"
    case globe = "globe"
    case critters = "critters"
    case cam = "cam"
    case settings = "settings"
    case map = "map"
    case songs = "songs"
    case update = "update"
    case diy = "diy"
    case flag = "flag"
    case shop = "shop"
    case design = "design"
    case camp = "camp"
    case message = "message"
}

enum ColorHex: String, CaseIterable {
    case hex1 = "BAC7E2"
    case hex2 = "F5D4A6"
    case hex3 = "99CFD7"
    case hex4 = "8365A4"
    case hex5 = "E48581"
    case hex6 = "EDCE6A"
    case hex7 = "54473F"
    case hex8 = "A8D6DE"
    case hex9 = "C2D1AA"
    case hex10 = "F2B15A"
    case hex11 = "CDD3E9"
    case hex12 = "87B578"
    case hex13 = "C3D560"
    case hex14 = "5E6CA9"
    case hex15 = "52453D"
    
}

enum UserDefaultsKeys : String {
    case isLoggedIn
    case username
}

enum DetailType {
    case bug
    case fish
    case fossil
    case seaCreature
    case villager
}

extension MessageKind {
    var messageContent: String {
        switch self {
        case .text(let message):
            return message
        case .attributedText(_):
            return "attributedText"
        case .photo(_):
            return "photo"
        case .video(_):
            return "video"
        case .location(_):
            return "location"
        case .emoji(_):
            return "emoji"
        case .audio(_):
            return "audio"
        case .contact(_):
            return "contact"
        case .linkPreview(_):
            return "linkPreview"
        case .custom(_):
            return "custom"
        }
    }
}

enum PubNubEventType {
    case messageReceived
    case connectionStatusChanged
    case presenceChanged
    case subscribeError
}

enum LoginSignUpError: LocalizedError {
    case incorrectPassword
    case emailExist
    case empty
    case invalidEmail
    case usernameExist
    case passwordDidNotMatch
    case notExist
    case shortPassword
    case longPassword
    case shortUsername
    case longUsername
    
    var localized: String {
        switch self {
        case .incorrectPassword:
            return L10n.incorrectPassword
        case .emailExist:
            return L10n.emailExist
        case .empty:
            return ""
        case .invalidEmail:
            return L10n.invalidEmail
        case .usernameExist:
            return L10n.usernameExist
        case .passwordDidNotMatch:
            return L10n.passwordNotMatch
        case .notExist:
            return L10n.invalidLoginUsernameOrEmail
        case .shortPassword:
            return L10n.shortPassword
        case .longPassword:
            return L10n.longPassword
        case .shortUsername:
            return L10n.shortUsername
        case .longUsername:
            return L10n.longUsername
        }
    }
}

enum Critters: CaseIterable {
    case bug
    case fish
    case fossil
    case seaCreatures
    
    var image: UIImage {
        switch self {
        case .bug:
            return Asset.bug.image
        case .fish:
            return Asset.fish.image
        case .fossil:
            return Asset.fossil.image
        case .seaCreatures:
            return Asset.seaCreature.image
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .bug:
            return L10n.bug.localized
        case .fish:
            return L10n.fish.localized
        case .fossil:
            return L10n.fossils.localized
        case .seaCreatures:
            return L10n.seaCreatures.localized
        }
    }
}
