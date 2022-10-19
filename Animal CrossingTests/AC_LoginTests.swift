//
//  AC_LoginTests.swift
//  Animal CrossingTests
//
//  Created by Leah Joy Ylaya on 12/3/20.
//

import XCTest
@testable import Animal_Crossing

class AC_LoginTests: XCTestCase {
    var userViewModel: UsersViewModel!
    
    override func setUp() {
        super.setUp()
        userViewModel = UsersViewModel(forSignUp: false)
    }
    
    override func tearDown() {
        userViewModel = nil
        super.tearDown()
    }
}
