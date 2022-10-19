//
//  AC_FishTest.swift
//  Animal CrossingTests
//
//  Created by Leah Joy Ylaya on 12/7/20.
//

import XCTest
@testable import Animal_Crossing

class AC_FishTest: XCTestCase {
    var url: URL!
    var fishViewModel: FishViewModel!
    
    override func setUp() {
        super.setUp()
        fishViewModel = FishViewModel()
    }
    
    
    override func tearDown() {
        fishViewModel = nil
        super.tearDown()
    }
    
    func testGetFishDetails() {
        let promise = expectation(description: #function)
        var fish: FishElement?
        let source = SingleFishResource()
        source.methodPath = "/nh/fish/Anchovy"
        APIRequest(resource: source).load { data in
            fish = data
            promise.fulfill()
        }
        wait(for: [promise], timeout: 30)
        XCTAssertNotNil(fish)
    }
    
}
