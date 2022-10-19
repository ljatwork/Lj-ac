//
//  AC_BugTest.swift
//  Animal CrossingTests
//
//  Created by Leah Joy Ylaya on 12/11/20.
//

import XCTest
@testable import Animal_Crossing

class AC_BugTest: XCTestCase {
    var bugViewModel: BugViewModel!
    
    override func setUp() {
        super.setUp()
        bugViewModel = BugViewModel()
    }
    
    
    override func tearDown() {
        bugViewModel = nil
        super.tearDown()
    }
    
    func testGetFishDetails() {
        let promise = expectation(description: #function)
        var bug: BugElement?
        let source = SingleBugResource()
        source.methodPath = "/nh/bugs/Agrias Butterfly"
        APIRequest(resource: source).load { data in
            bug = data
            promise.fulfill()
        }
        wait(for: [promise], timeout: 30)
        XCTAssertNotNil(bug)
    }
    
}
