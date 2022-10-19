//
//  FishViewModel.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/7/20.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

class FishViewModel {
    var fishListResult: MutableProperty<Fish> = MutableProperty([])
    var fishList: MutableProperty<Fish> = MutableProperty([])
    var searchProperty = MutableProperty("")
    
    init() {
        fetchFishes()
        reactiveSearchSetup()
    }
    
    func fetchFishes() {
        let source = FishesResource()
        source.queryItems = []
        APIRequest(resource: source).load { [weak self] (data) in
            if let fish = data {
                self?.fishList.value = fish
                self?.fishListResult.value = fish
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
                self.fishListResult.value = self.fishList.value
            } else {
                let origList = self.fishList.value
                self.fishListResult.value = origList.filter {(villager) -> Bool in
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
    lazy var fishValue = FishElement(name: "", imageURL: "", location: .pier, shadowSize: "", rarity: .rare, nookPrice: 0, cjPrice: 0, tankWidth: 0, tankLength: 0, catchphrases: [], north: Hemisphere(availabilityArray: [AvailabilityArray(months: "", time: "")]), south: Hemisphere(availabilityArray: [AvailabilityArray(months: "", time: "")]))
    lazy var singleFish: MutableProperty<FishElement> = MutableProperty(fishValue)
    
    func fetchSingleFish(queryItems: [URLQueryItem]) {
        let source = SingleFishResource()
        let fishName = queryItems.first(where: { $0.name == "name" })?.value
        source.methodPath = "/nh/fish/\(fishName ?? "")".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        APIRequest(resource: source).load { [weak self] (data) in
            if let fish = data {
                self?.singleFish.value = fish
            }
        }
    }
}
