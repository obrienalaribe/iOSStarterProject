//
//  AuthValidatorTest.swift
//  ChurchFinder
//
//  Created by mac on 1/25/17.
//  Copyright © 2017 mac. All rights reserved.
//

import XCTest
@testable import ChurchFinder

class AuthValidatorTest: XCTestCase {
    var authValidator : AuthRequestValidator!
    
    override func setUp() {
        super.setUp()
        authValidator = AuthRequestValidator()
    }
    
    override func tearDown() {super.tearDown()    }
    
    func testForValidEmail() {
        let validEmail = "obr@test.com"
        let invalidEmail = "unknown.com"
        let emptyString = ""
        
        XCTAssertTrue(authValidator.emailIsValid(email: validEmail))
        XCTAssertFalse(authValidator.emailIsValid(email: invalidEmail))
        XCTAssertFalse(authValidator.emailIsValid(email: emptyString))

    }
    
    func testRegisterFormIsValid(){
        let registrationWithNilValue = User(name: nil, email: "user@test.com", password: "password")
        let registrationWithEmptyString = User(name: "test", email: "", password: "")
        
        let registrationWithCompleteInputs = User(name: "tester", email: "tester@test.com", password: "password")
        
        let registrationWithInvalidEmail = User(name: "test", email: "unknown.com", password: "")
        
        XCTAssertFalse(authValidator.isRegistrationDetailsValid(user: registrationWithNilValue))
        XCTAssertFalse(authValidator.isRegistrationDetailsValid(user: registrationWithEmptyString))
        XCTAssertFalse(authValidator.isRegistrationDetailsValid(user: registrationWithInvalidEmail))
        XCTAssertTrue(authValidator.isRegistrationDetailsValid(user: registrationWithCompleteInputs))
       

    }
    
    
    
}
