//
//  MockSignupValidator.swift
//  PhotoAppTests
//
//  Created by Mohamed osama on 26/06/2022.
//

import Foundation
@testable import PhotoApp

class MockSignupValidator: SignupFormModelValidatorProtocol{

    var isFirstNameValidate = false
    var isLastNameValid = false
    var isEmailValid = false
    var isPasswordMatching = false
    
    func validateFirstName(firstName: String) -> Bool {
        isFirstNameValidate = true
        return isFirstNameValidate
    }
    
    func validateLastName(lastName: String) -> Bool {
        isLastNameValid = true
        return isLastNameValid
    }
    
    func validateEmail(email: String) -> Bool {
        isEmailValid = true
        
        return isEmailValid
    }
    
    func validatePasswordMatching(password: String, re_password: String) -> Bool {
        isPasswordMatching = true
        return isPasswordMatching
    }
    
    
}
