//
//  SignupWebService.swift
//  PhotoAppTests
//
//  Created by Mohamed osama on 25/06/2022.
//

import XCTest
@testable import PhotoApp

class SignupWebServiceTest: XCTestCase {
    
    var sut: SignupWebService!
    
    override func setUp(){
        sut = SignupWebService(url: "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users")
        
    }
    
    override func tearDown(){
        sut = nil
    }
    
    func testSignupWebService_WhenGivenSuccessfullyResponse_ShouldReturnSuccess(){
        
        let signupFormRequestModel = SignupFromRequestModel(firstName: "Mohamed", lastName: "osama", email: "mohamed.osama9812@gmail.com", password: "mo128899")
        let expectation = self.expectation(description: "waiting until response")
        sut.signup(with: signupFormRequestModel) { response, error in
            XCTAssertEqual(response?.status, "ok")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
}
