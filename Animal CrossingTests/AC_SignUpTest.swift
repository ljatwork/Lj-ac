//
//  AC_SignUpTest.swift
//  Animal CrossingTests
//
//  Created by Leah Joy Ylaya on 12/3/20.
//

import XCTest
@testable import Animal_Crossing

class AC_SignUpTest: XCTestCase {
    var userViewModel: UsersViewModel!
    
    override func setUp() {
        super.setUp()
        userViewModel = UsersViewModel(forSignUp: true)
    }
    
    override func tearDown() {
        userViewModel = nil
        super.tearDown()
    }
    
    func testValidEmail() {
        let errMssg: LoginSignUpError? = "email@email.com".validateEmail()
        XCTAssert(errMssg == nil, "Error messaage should be nil since email is valid.")
    }
    
    func testInvalidEmail() {
        let expectedError = LoginSignUpError.invalidEmail
        var error: LoginSignUpError?
        error = "okok".validateEmail()
        XCTAssertEqual(expectedError, error)
    }
    
    func testValidUsername() {
        let errMssg: LoginSignUpError? = "username".validateUsernameCount()
        XCTAssert(errMssg == nil, "Error messaage should be nil since email is valid.")
    }
    
    func testUsernameTooShort() {
        let expectedError = LoginSignUpError.shortUsername
        var error: LoginSignUpError?
        error = "he".validateUsernameCount()
        XCTAssertEqual(expectedError, error)
    }
    
    func testUsernameTooLong() {
        let expectedError = LoginSignUpError.longUsername
        var error: LoginSignUpError?
        error = "kameeeeeehameeeeeehaaaaaaaaaaa".validateUsernameCount()
        XCTAssertEqual(expectedError, error)
    }
    
    func testValidPassword() {
        let errMssg: LoginSignUpError? = "strongpassword".validatePasswordCount()
        XCTAssert(errMssg == nil, "Error messaage should be nil since email is valid.")
    }
    
    func test_password_too_short() {
        let expectedError = LoginSignUpError.shortPassword
        var error: LoginSignUpError?
        error = "pa".validatePasswordCount()
        XCTAssertEqual(expectedError, error)
    }
    
    func testPasswordTooLong() {
        let expectedError = LoginSignUpError.longPassword
        var error: LoginSignUpError?
        error = "thisismyveryverystrongpasswordn".validatePasswordCount()
        XCTAssertEqual(expectedError, error)
    }
    
    func testValidConfirmPassword() {
        let errMssg: LoginSignUpError? = "mypassword".validateConfirmPassword(password: "mypassword")
        XCTAssert(errMssg == nil, "Error messaage should be nil since email is valid.")
    }
    
    func testInvalidConfirmPassword() {
        let expectedError = LoginSignUpError.passwordDidNotMatch
        var error: LoginSignUpError?
        error = "confirmpassword".validateConfirmPassword(password: "mypassword")
        XCTAssertEqual(expectedError, error)
    }
    
    func testConfirmPasswordTooShort() {
        let expectedError = LoginSignUpError.shortPassword
        var error: LoginSignUpError?
        error = "pa".validateConfirmPassword(password: "mypassword")
        XCTAssertEqual(expectedError, error)
    }
    
    func testConfirmPasswordTooLong() {
        let expectedError = LoginSignUpError.longPassword
        var error: LoginSignUpError?
        error = "thisismyveryverystrongpasswordn".validateConfirmPassword(password: "mypassword")
        XCTAssertEqual(expectedError, error)
    }
}
