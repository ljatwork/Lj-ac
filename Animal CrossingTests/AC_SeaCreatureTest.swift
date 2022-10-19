//
//  AC_SeaCreatureTest.swift
//  Animal CrossingTests
//
//  Created by Leah Joy Ylaya on 12/11/20.
//

import XCTest
@testable import Animal_Crossing

class AC_SeaCreatureTest: XCTestCase {
    var seaCreatureViewModel: SeaCreatureViewModel!
    
    override func setUp() {
        super.setUp()
        seaCreatureViewModel = SeaCreatureViewModel()
    }
    
    
    override func tearDown() {
        seaCreatureViewModel = nil
        super.tearDown()
    }
    
    func testGetSeaCreatureDetails() {
        let promise = expectation(description: #function)
        var seaCreature: SeaCreatureElement?
        let source = SingleSeaCreatureResource()
        source.methodPath = "/nh/sea/Octopus"
        APIRequest(resource: source).load { data in
            seaCreature = data
            promise.fulfill()
        }
        wait(for: [promise], timeout: 30)
        XCTAssertNotNil(seaCreature)
    }
        
}
