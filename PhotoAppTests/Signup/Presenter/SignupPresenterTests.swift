//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Mohamed osama on 26/06/2022.
//

import XCTest
@testable import PhotoApp

class SignupPresenterTests: XCTestCase {

    var model: SignupFormModel!
    var mockValidator: MockSignupValidator!
    var mockWebService: MockWebService!
    var sut: SignupPresenter!
    
    override func setUp(){
        model = SignupFormModel(firstName: "Mohamed", lastName: "osama", email: "mohamed.osama9812@gmail.com", password: "mo128899", repeatPassword: "mo128899")
        mockValidator = MockSignupValidator()
        mockWebService = MockWebService()
        sut = SignupPresenter(signupFormModelValidator: mockValidator, signupWebServiceProtocol: mockWebService)
    }
    
    override func tearDown(){
        model = nil
        mockValidator = nil
        mockWebService = nil
        sut = nil
    }

    func testSignupPresenter_WhenProvidedData_WillValidateEachProperty(){
        
        sut.processSignup(model: model, signupWebServiceProtocol: mockWebService)
        
        XCTAssertTrue(mockValidator.isFirstNameValidate)
        XCTAssertTrue(mockValidator.isLastNameValid)
        XCTAssertTrue(mockValidator.isEmailValid)
        XCTAssertTrue(mockValidator.isPasswordMatching)
    }
    
    func testSignupPresenter_WhenGivenFormDataValid_ShouldCallSignupMethod(){
        
        sut.processSignup(model: model, signupWebServiceProtocol: mockWebService)
        
        XCTAssertTrue(mockWebService.isSignupMethodCalled)
    }

}
