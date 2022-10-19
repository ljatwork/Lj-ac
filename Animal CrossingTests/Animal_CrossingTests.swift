//
//  Animal_CrossingTests.swift
//  Animal CrossingTests
//
//  Created by Leah Joy Ylaya on 11/19/20.
//

import XCTest
@testable import Animal_Crossing

class Animal_CrossingTests: XCTestCase {
    
    var url: URL!
    var villagersViewModel: VillagersViewModel!
    
    override func setUp() {
        super.setUp()
        url = URL(string: "https://api.nookipedia.com/")!
        villagersViewModel = VillagersViewModel(specie: .Squirrel)
    }
    
    override func tearDown() {
        villagersViewModel = nil
        url = nil
        super.tearDown()
    }
    
    func testGetVillagerDetails() {
        let promise = expectation(description: #function)
        var villager: VillagerValue?
        let source = SingleVillagerResource()
        source.queryItems = [
            URLQueryItem(name: "species", value: villagersViewModel.specie.rawValue),
            URLQueryItem(name: "game", value: "NH"),
            URLQueryItem(name: "name", value: "Marshal")
        
        ]
        APIRequest(resource: source).load { villagerDetail in
            villager = villagerDetail?.first
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)
        XCTAssertNotNil(villager)
    }

}
