//
//  SeaCreatureModel.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/11/20.
//

import Foundation

struct SeaCreatureValue: Codable {
    let name: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
    }
}
// MARK: - SeaCreatureElement
struct SeaCreatureElement: Codable {
    let name: String
    let imageURL: String
    let shadowSize, shadowMovement: String
    let rarity: Rarity
    let nookPrice, tankWidth, tankLength: Int
    let catchphrases: [String]
    let north, south: Hemisphere

    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
        case shadowSize = "shadow_size"
        case shadowMovement = "shadow_movement"
        case rarity
        case nookPrice = "sell_nook"
        case tankWidth = "tank_width"
        case tankLength = "tank_length"
        case catchphrases, north, south
    }
}

typealias SeaCreatures = [SeaCreatureValue]
