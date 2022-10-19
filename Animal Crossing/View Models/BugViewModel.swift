//
//  BugViewModel.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/11/20.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

class BugViewModel {
    var bugListResult: MutableProperty<Bugs> = MutableProperty([])
    var bugList: MutableProperty<Bugs> = MutableProperty([])
    var searchProperty = MutableProperty("")
    
    init() {
        fetchBuges()
        reactiveSearchSetup()
    }
    
    func fetchBuges() {
        let source = BugsResource()
        source.queryItems = []
        APIRequest(resource: source).load { [weak self] (data) in
            if let bugs = data {
                self?.bugList.value = bugs
                self?.bugListResult.value = bugs
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
                self.bugListResult.value = self.bugList.value
            } else {
                let origList = self.bugList.value
                self.bugListResult.value = origList.filter {(villager) -> Bool in
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
    
    lazy var bugValue = BugElement(name: "", imageURL: "", location: "", rarity: .empty, nookPrice: 0, flickPrice: 0, tankWidth: 0, tankLength: 0, catchphrases: [], north: Hemisphere(availabilityArray: [AvailabilityArray(months: "", time: "")]), south: Hemisphere(availabilityArray: [AvailabilityArray(months: "", time: "")]))
    lazy var singleBug: MutableProperty<BugElement> = MutableProperty(bugValue)
    
    func fetchSingleBug(queryItems: [URLQueryItem]) {
        let source = SingleBugResource()
        let bugName = queryItems.first(where: { $0.name == "name" })?.value
        source.methodPath = "/nh/bugs/\(bugName ?? "")"
        APIRequest(resource: source).load { [weak self] (data) in
            if let Bug = data {
                self?.singleBug.value = Bug
            }
        }
    }
}

