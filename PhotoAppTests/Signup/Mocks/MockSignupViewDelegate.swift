//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Mohamed osama on 27/06/2022.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol{
    var expectation: XCTestExpectation?
    var signupSuccessfullyCounter = 0
    var failedCounter = 0
    
    func successfullSignup() {
        signupSuccessfullyCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandller(error: SignupError?) {
        failedCounter  += 1
        expectation?.fulfill()
    }
    
}
