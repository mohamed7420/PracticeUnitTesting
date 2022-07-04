//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by Mohamed osama on 03/07/2022.
//

import Foundation
@testable import PhotoApp

class MockSignupPresenter: SignupPresenterProtocol{

    var isProcessSignupCalled: Bool!

    required init(signupFormModelValidator: SignupFormModelValidatorProtocol, signupWebServiceProtocol: SignupWebServiceProtocol, signupViewDelegateProtocol: SignupViewDelegateProtocol) {
        
    }
    
    func processSignup(model: SignupFormModel, signupWebServiceProtocol: SignupWebServiceProtocol) {
            isProcessSignupCalled = true
    }
    
    
}
