//
//  APIResource.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/19/20.
//

import Foundation
import UIKit
/*
 * Implemented https://matteomanferdini.com/network-requests-rest-apis-ios-swift/
 */

protocol APIResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
    var queryItems: [URLQueryItem] {get}
}

class VillagerResource: APIResource {
    typealias ModelType = Villager
    let methodPath = "/villagers"
    var queryItems: [URLQueryItem] = []
}

class SingleVillagerResource: APIResource {
    typealias ModelType = Villagers
    let methodPath = "/villagers"
    var queryItems: [URLQueryItem] = []
}

class FishesResource: APIResource {
    typealias ModelType = Fish
    let methodPath = "/nh/fish"
    var queryItems: [URLQueryItem] = []
}

class SingleFishResource: APIResource {
    typealias ModelType = FishElement
    var methodPath = "/nh/fish"
    var queryItems: [URLQueryItem] = []
}

class SeaCreaturesResource: APIResource {
    typealias ModelType = SeaCreatures
    let methodPath = "/nh/sea"
    var queryItems: [URLQueryItem] = []
}

class SingleSeaCreatureResource: APIResource {
    typealias ModelType = SeaCreatureElement
    var methodPath = "/nh/sea"
    var queryItems: [URLQueryItem] = []
}

class FossilsResource {
    let methodPath = "/fossils"
    
}

class BugsResource: APIResource {
    typealias ModelType = Bugs
    let methodPath = "/nh/bugs"
    var queryItems: [URLQueryItem] = []
}

class SingleBugResource: APIResource {
    typealias ModelType = BugElement
    var methodPath = "/nh/bugs"
    var queryItems: [URLQueryItem] = []
}

class MusicsResource {
    let methodPath = "/songs"
    
}

class ArtworkResource: APIResource {
    typealias ModelType = Artworks
    let methodPath = "/nh/art"
    var queryItems: [URLQueryItem] = []
}

class SingleArtworkResource: APIResource {
    typealias ModelType = ArtworkElement
    var methodPath = "/nh/art"
    var queryItems: [URLQueryItem] = []
}
