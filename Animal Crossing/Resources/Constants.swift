//
//  Constants.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/19/20.
//

import Foundation
import UIKit

class Constants {
    static let shared = Constants()
    var menu: [String] = ["globe", "critters", "friends", "cam", "settings", "map", "songs", "update", "diy", "shop", "design", "camp", "message"
    ]
    let CONTENT_COLOR_1: String = "ED9E72"
    let CONTENT_COLOR_2: String = "C29CF1"
    static let screenSize: CGRect = UIScreen.main.bounds
    static let SCREEN_WIDTH: CGFloat = Constants.screenSize.width
    static let SCREEN_HEIGHT: CGFloat = Constants.screenSize.height
    static let PUBNUB_PUBLISH_KEY: String = "pub-c-1d7e972b-15c2-45eb-8ec6-786e2937a61b"
    static let PUBNUB_SUBSCRIBE_KEY: String = "sub-c-931f608e-3078-11eb-8e02-129fdf4b0d84"
    static let PUBNUB_SECRET_KEY: String = "sec-c-Njk4OTBkZTItNjY0Yy00MmMzLWJlN2EtZjU0ZWJlMTczMmE2"
    static let PUBNUB_CHANNEL: String = "AC_channel"

}
