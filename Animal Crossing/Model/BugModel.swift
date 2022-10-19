//
//  BugModel.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/11/20.
//

import Foundation

// MARK: - BugElement
struct BugElement: Codable {
    let name: String
    let imageURL: String
    let location: String
    let rarity: Rarity
    let nookPrice: Int
    let flickPrice: Int?
    let tankWidth, tankLength: Int
    let catchphrases: [String]
    let north, south: Hemisphere

    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
        case location, rarity
        case nookPrice = "sell_nook"
        case flickPrice = "sell_flick"
        case tankWidth = "tank_width"
        case tankLength = "tank_length"
        case catchphrases, north, south
    }
}

struct BugValue: Codable {
    let name: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
    }
}


typealias Bugs = [BugValue]
