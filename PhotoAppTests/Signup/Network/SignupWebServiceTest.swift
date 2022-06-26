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
    var urlConfigration: URLSessionConfiguration!
    var urlSession: URLSession!
    var jsonData = "{\"path\" : \"/users\", \"error\": \"Internal Server Error\"}"
    var signupFormRequestModel: SignupFromRequestModel!
    
    override func setUp(){
        urlConfigration = URLSessionConfiguration.ephemeral
        urlConfigration.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: urlConfigration)
        MockURLProtocol.stubResponseData = jsonData.data(using: .utf8)
        sut = SignupWebService(url: "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users" , urlSession: urlSession)
        signupFormRequestModel = SignupFromRequestModel(firstName: "Mohamed", lastName: "osama", email: "mohamed.osama9812@gmail.com", password: "mo128899")
    }
    
    override func tearDown(){
        sut = nil
        signupFormRequestModel = nil
        urlConfigration = nil
        urlSession = nil
        MockURLProtocol.stubResponseData = nil
        
    }
    
    func testSignupWebService_WhenGivenSuccessfullyResponse_ShouldReturnSuccess(){
        jsonData = "{\"status\": \"ok\"}"
        urlConfigration = URLSessionConfiguration.ephemeral
        urlConfigration.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: urlConfigration)
        MockURLProtocol.stubResponseData = jsonData.data(using: .utf8)
        let expectation = self.expectation(description: "waiting until response")
        sut.signup(with: signupFormRequestModel) { response, error in
            XCTAssertEqual(response?.status, "ok")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenGivenErrorResponse_ShouldReturnError(){
                
        let expectation = self.expectation(description: "waiting until response")
        sut.signup(with: signupFormRequestModel) { response, error in
            
            XCTAssertNil(response)
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenEmptyURLProvided_ShouldReturnError(){
        let expectation = self.expectation(description: "empty url request")
        sut = SignupWebService(url: "")
        sut.signup(with: SignupFromRequestModel(firstName: "mohamed", lastName: "osama", email: "mohamed.osama9812@gmail.com", password: "mo128899")) { response, error in
            XCTAssertNil(response)
            XCTAssertEqual(error, SignupError.responseModelParsingError)
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }
    
}
