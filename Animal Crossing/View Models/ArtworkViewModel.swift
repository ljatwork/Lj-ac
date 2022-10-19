//
//  ArtworkViewModel.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/11/20.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

class ArtworkViewModel {
    var artworkListResult: MutableProperty<Artworks> = MutableProperty([])
    var artworkList: MutableProperty<Artworks> = MutableProperty([])
    var searchProperty = MutableProperty("")
    
    init() {
        fetchBuges()
        reactiveSearchSetup()
    }
    
    func fetchBuges() {
        let source = ArtworkResource()
        source.queryItems = []
        APIRequest(resource: source).load { [weak self] (data) in
            if let artworks = data {
                self?.artworkList.value = artworks
                self?.artworkListResult.value = artworks
            }
        }
    }
    
    func reactiveSearchSetup() {
        searchProperty.signal.observeValues { [weak self] (search) in
            guard let self = `self` else {
                return
            }
            let lowerCased = search.lowercased()
            if search.isEmpty {
                self.artworkListResult.value = self.artworkList.value
            } else {
                let origList = self.artworkList.value
                self.artworkListResult.value = origList.filter {(villager) -> Bool in
                    let result = villager.name.lowercased().contains(lowerCased)
                    return result
                }
            }
        }
    }
    
    func didSearchBarValueChanged(value: String) {
        searchProperty.value = value
    }
    
    // used for mutable initial value
    lazy var artworkValue = ArtworkElement(name: "", imageURL: "", hasFake: false, fakeImageURL: "", artName: "", author: "", year: "", artStyle: "", artworkDescription: "", buy: 0, sell: 0, authenticity: "", width: 0, length: 0)
    lazy var singleArtwork: MutableProperty<ArtworkElement> = MutableProperty(artworkValue)
    
    func fetchSingleArtwork(artname: String) {
        let source = SingleArtworkResource()
        source.methodPath = "/nh/art/\(artname)"
        APIRequest(resource: source).load { [weak self] (data) in
            if let artwork = data {
                self?.singleArtwork.value = artwork
            }
        }
    }
}

