//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Mohamed osama on 26/06/2022.
//

import XCTest
@testable import PhotoApp

class SignupPresenterTests: XCTestCase {

    override func setUp(){
            
        
    }
    
    override func tearDown(){
        
    }

    func testSignupPresenter_WhenProvidedData_WillValidateEachProperty(){
        
        let model = SignupFormModel(firstName: "Mohamed", lastName: "osama", email: "mohamed.osama9812@gmail.com", password: "mo128899", repeatPassword: "mo128899")
        let mockValidator = MockSignupValidator()
        let sut = SignupPresenter(signupFormModelValidator: mockValidator)
        sut.processSignup(model: model)
        
        XCTAssertTrue(mockValidator.isFirstNameValidate)
        XCTAssertTrue(mockValidator.isLastNameValid)
        XCTAssertTrue(mockValidator.isEmailValid)
        XCTAssertTrue(mockValidator.isPasswordMatching)
    }

}
