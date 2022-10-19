//
//  FishModel.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/3/20.
//

import Foundation

struct FishValue: Codable {
    let name: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
    }
}

// MARK: - FishElement
struct FishElement: Codable {
    let name: String
    let imageURL: String
    let location: Location
    let shadowSize: String
    let rarity: Rarity
    let nookPrice, cjPrice, tankWidth, tankLength: Int
    let catchphrases: [String]
    let north, south: Hemisphere

    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
        case location
        case shadowSize = "shadow_size"
        case rarity
        case nookPrice = "sell_nook"
        case cjPrice = "sell_cj"
        case tankWidth = "tank_width"
        case tankLength = "tank_length"
        case catchphrases, north, south
    }
}

enum Location: String, Codable {
    case pier = "Pier"
    case pond = "Pond"
    case river = "River"
    case riverClifftop = "River (clifftop)"
    case riverMouth = "River (mouth)"
    case sea = "Sea"
    case seaRainyDays = "Sea (rainy days)"
}

// MARK: - North
struct Hemisphere: Codable {
    let availabilityArray: [AvailabilityArray]
    
    enum CodingKeys: String, CodingKey {
        case availabilityArray = "availability_array"
    }
}

// MARK: - AvailabilityArray
struct AvailabilityArray: Codable {
    let months: String
    let time: String?
}

enum Rarity: String, Codable {
    case empty = ""
    case rare = "Rare"
    case uncommon = "Uncommon"
    case unknown = "Unknown"
}

typealias Fish = [FishValue]
