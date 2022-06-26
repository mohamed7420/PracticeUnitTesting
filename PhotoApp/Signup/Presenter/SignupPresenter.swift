//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Mohamed osama on 26/06/2022.
//

import Foundation

class SignupPresenter{
    
    //dependency injection
    var signupFormModelValidator: SignupFormModelValidatorProtocol
    
    init(signupFormModelValidator: SignupFormModelValidatorProtocol) {
        self.signupFormModelValidator = signupFormModelValidator
    }
    
    func processSignup(model: SignupFormModel){
        
        if !signupFormModelValidator.validateFirstName(firstName: model.firstName){
            return
        }
        if !signupFormModelValidator.validateLastName(lastName: model.lastName){
            return
        }
        
        if !signupFormModelValidator.validateEmail(email: model.email){
            return
        }
        if !signupFormModelValidator.validatePasswordMatching(password: model.password, re_password: model.repeatPassword){
            return
        }
    }
}
