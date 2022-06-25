//
//  SignupFormModelValidatorTests.swift
//  PhotoAppTests
//
//  Created by Mohamed osama on 23/06/2022.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {

    var sut: SignupFormModelValidatorProtocol!
    
    override func setUp(){
        //Arrange
        sut = SignupFormModelValidator()
    }

    override func tearDown(){
        //remove system under test from memmory
        sut = nil
    }
    
    func testSignFromModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue(){
        
        //Act
        let isFirstNameValid = sut.validateFirstName(firstName: "Mohamed")
        //Assert
        XCTAssertFalse(!isFirstNameValid, "First name should return true is user enter more than 3 charaters")
        
    }
    
    func testSignFormModelValidator_WhenShortFirstNameProvided_ShouldReturnFalse(){
        //Act
        let isFirstNameValid = sut.validateFirstName(firstName: "m")
    
        XCTAssertFalse(isFirstNameValid , "first name should less than 3 character should return false")
    }
    
    func testSignFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue(){
        
        let isEmailValid = sut.validateEmail(email: "mohamed.osama9812@gmail.com")
        
        XCTAssertTrue(isEmailValid, "email valid because it contain . and @")
    
    }
    
    func testSignFormModelValidator_WhenInvalidEmailProvided_ShouldReturnFalse(){
        
        let isEmailValid = sut.validateEmail(email: "mohamedosama9812@gmailcom")

        XCTAssertFalse(isEmailValid, "email valid because it contain . and @")

    }
    
    func testSignFormModelValidator_WhenMatchingPasswordProvided_ShouldReturnTrue(){

        let isPasswordsMatching = sut.validatePasswordMatching(password: "mo128899", re_password: "mo128899")

        XCTAssertTrue(isPasswordsMatching, "repassword should matching password")
    }
    
    func testSignFormModelValidator_WhenNotMatchingPasswordProvided_ShouldReturnTrue(){

        let isPasswordsMatching = sut.validatePasswordMatching(password: "mo128899", re_password: "mo12889")

        XCTAssertFalse(isPasswordsMatching, "repassword should matching password")
    }
}
