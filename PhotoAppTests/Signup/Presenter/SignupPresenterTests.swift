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
    var mockSignupViewDelegate: MockSignupViewDelegate!
    
    override func setUp(){
        model = SignupFormModel(firstName: "Mohamed", lastName: "osama", email: "mohamed.osama9812@gmail.com", password: "mo128899", repeatPassword: "mo128899")
        mockValidator = MockSignupValidator()
        mockWebService = MockWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        sut = SignupPresenter(signupFormModelValidator: mockValidator, signupWebServiceProtocol: mockWebService, signupViewDelegateProtocol: mockSignupViewDelegate)
    }
    
    override func tearDown(){
        model = nil
        mockValidator = nil
        mockWebService = nil
        sut = nil
        mockSignupViewDelegate = nil
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
    
    func testSignupPresenter_WhenSignupOperationSuccessfully_CallsSuccessOnViewDelegate(){
        let expectation = self.expectation(description: "Expected the success signup() method to be called")
        mockSignupViewDelegate = MockSignupViewDelegate()
        mockSignupViewDelegate.expectation = expectation
        sut.processSignup(model: model, signupWebServiceProtocol: mockWebService)
        expectation.fulfill()
        self.wait(for: [expectation], timeout: 5)
        XCTAssertEqual(mockSignupViewDelegate.signupSuccessfullyCounter, 0)
    }
    
    func testSignupPresenter_WhenSignupOperationFailed_CallHanldeErrorOnViewDelegate(){
        let expectation = self.expectation(description: "Expected the failed signup() method to be called")
        mockSignupViewDelegate = MockSignupViewDelegate()
        mockSignupViewDelegate.expectation = expectation
        sut.processSignup(model: model, signupWebServiceProtocol: mockWebService)
        expectation.fulfill()
        self.wait(for: [expectation], timeout: 5)
        XCTAssertEqual(mockSignupViewDelegate.failedCounter, 0)
    }

}
