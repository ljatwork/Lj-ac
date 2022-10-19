//
//  SeaCreatureViewModel.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/11/20.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

class SeaCreatureViewModel {
    var seaCreatureListResult: MutableProperty<SeaCreatures> = MutableProperty([])
    var seaCreatureList: MutableProperty<SeaCreatures> = MutableProperty([])
    var searchProperty = MutableProperty("")
    
    init() {
        fetchBuges()
        reactiveSearchSetup()
    }
    
    func fetchBuges() {
        let source = SeaCreaturesResource()
        source.queryItems = []
        APIRequest(resource: source).load { [weak self] (data) in
            if let SeaCreatures = data {
                self?.seaCreatureList.value = SeaCreatures
                self?.seaCreatureListResult.value = SeaCreatures
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
                self.seaCreatureListResult.value = self.seaCreatureList.value
            } else {
                let origList = self.seaCreatureList.value
                self.seaCreatureListResult.value = origList.filter {(villager) -> Bool in
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
    lazy var seaCreatureValue = SeaCreatureElement(name: "", imageURL: "", shadowSize: "", shadowMovement: "", rarity: .empty, nookPrice: 0, tankWidth: 0, tankLength: 0, catchphrases: [], north: Hemisphere(availabilityArray: [AvailabilityArray(months: "", time: "")]), south: Hemisphere(availabilityArray: [AvailabilityArray(months: "", time: "")]))
    lazy var singleSeaCreature: MutableProperty<SeaCreatureElement> = MutableProperty(seaCreatureValue)
    
    func fetchSingleSeaCreature(queryItems: [URLQueryItem]) {
        let source = SingleSeaCreatureResource()
        let seaCreatureName = queryItems.first(where: { $0.name == "name" })?.value
        source.methodPath = "/nh/sea/\(seaCreatureName ?? "")"
        APIRequest(resource: source).load { [weak self] (data) in
            if let seaCreature = data {
                self?.singleSeaCreature.value = seaCreature
            }
        }
    }
}


