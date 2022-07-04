//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by Mohamed osama on 26/06/2022.
//

import Foundation
@testable import PhotoApp

class MockWebService: SignupWebServiceProtocol{
    
    var isSignupMethodCalled = true
    
    func signup(with model: SignupFromRequestModel, completion: @escaping Completion) {
        isSignupMethodCalled = true
        let response = SignupResponseModel(status: "ok")
        completion(response , nil)
    }
    
}
