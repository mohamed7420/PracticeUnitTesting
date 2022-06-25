//
//  SignFormModelValidator.swift
//  PhotoApp
//
//  Created by Mohamed osama on 23/06/2022.
//

import Foundation

protocol SignupFormModelValidatorProtocol{
    func validateFirstName(firstName: String) -> Bool
    func validateLastName(lastName: String) -> Bool
    func validateEmail(email: String) -> Bool
    func validatePasswordMatching(password: String , re_password: String) -> Bool
}

class SignupFormModelValidator: SignupFormModelValidatorProtocol{
    
    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    var re_password: String?
    
    func validateFirstName(firstName: String) -> Bool{
        let returnedValue = firstName.isEmpty ? false : true
        let isFirstNameShort = firstName.count >= 3 ? true : false
        return returnedValue && isFirstNameShort
    }
    
    func validateLastName(lastName: String) -> Bool{
        let returnedValue = lastName.isEmpty ? false : true
        let isLastNameTooShort = lastName.count >= 3 ? true : false
        return returnedValue && isLastNameTooShort
    }
    func validateEmail(email: String) -> Bool{
        let isEmailValid = email.contains("@") && email.contains(".")
        return isEmailValid == true
    }
    
    func validatePasswordMatching(password: String , re_password: String) -> Bool{
        let isPasswordMatching = password == re_password
        return isPasswordMatching
    }
}
