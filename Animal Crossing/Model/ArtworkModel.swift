//
//  ArtworkModel.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/11/20.
//

import Foundation

// MARK: - ArtworkElement
struct ArtworkElement: Codable {
    let name: String
    let imageURL: String
    let hasFake: Bool
    let fakeImageURL: String
    let artName, author, year, artStyle: String
    let artworkDescription: String
    let buy, sell: Int
    let authenticity: String
    let width: Int
    let length: Double

    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
        case hasFake = "has_fake"
        case fakeImageURL = "fake_image_url"
        case artName = "art_name"
        case author, year
        case artStyle = "art_style"
        case artworkDescription = "description"
        case buy, sell, authenticity, width, length
    }
}

struct ArtworkValue: Codable {
    let name: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
    }
}

typealias Artworks = [ArtworkValue]
