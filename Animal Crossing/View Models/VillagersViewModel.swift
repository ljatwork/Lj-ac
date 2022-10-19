//
//  VillagersViewModel.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/20/20.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa


//https://www.youtube.com/watch?v=6KC1GdLnez0&ab_channel=iVish
class VillagersViewModel {
    var villagersResult: MutableProperty<Villager> = MutableProperty([])
    var villagerList: MutableProperty<Villager> = MutableProperty([])
    var searchProperty = MutableProperty("")
    var specie: Species = .Alligator
    
    init() {}
    
    init(specie: Species) {
        self.specie = specie
        fetchVillagers()
        reactiveSearchSetup()
    }
    
    func fetchVillagers() {
    
        let source = VillagerResource()
        source.queryItems = [
            URLQueryItem(name: "species", value: specie.rawValue),
            URLQueryItem(name: "game", value: "NH")
        ]
        APIRequest(resource: source).load { [weak self] (villager) in
            if let villagers = villager {
                self?.villagerList.value = villagers
                self?.villagersResult.value = villagers
            }
        }
    }
    
    func reactiveSearchSetup() {
        searchProperty.signal.observeValues { [weak self] (search) in
            guard let strongSelf = self else {
                return
            }
            let lowerCased = search.lowercased()
            if search.isEmpty {
                strongSelf.villagersResult.value = strongSelf.villagerList.value
            } else {
                let origList = strongSelf.villagerList.value
                strongSelf.villagersResult.value = origList.filter {(villager) -> Bool in
                    let result = (villager.name.lowercased().contains(lowerCased) ||
                                    villager.personality.rawValue.lowercased().contains(lowerCased))
                    return result
                }
            }
        }
    }
    
    func didSearchBarValueChanged(value: String) {
        searchProperty.value = value
    }
    
    // used for mutable initial value
    let villagerValue = VillagerValue(name: "", id: "", imageURL: "", species: "", personality: Personality.cranky, gender: Gender.female, birthdayMonth: BirthdayMonth.april, birthdayDay: "", sign: Sign.aquarius, quote: "", phrase: "", clothing: "", islander: false)
    lazy var singleVillager: MutableProperty<VillagerValue> = MutableProperty(villagerValue)
    
    func fetchSingleVillager(queryItems: [URLQueryItem]) {
        let source = SingleVillagerResource()
        source.queryItems = queryItems
        APIRequest(resource: source).load { [weak self] (data) in
            if let villager = data?.first {
                self?.singleVillager.value = villager
            }
        }
    }
}
