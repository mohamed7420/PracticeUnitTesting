//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Mohamed osama on 26/06/2022.
//

import Foundation

class SignupPresenter{
    
    //dependency injection
    private var signupFormModelValidator: SignupFormModelValidatorProtocol
    private var signupWebServiceProtocol: SignupWebServiceProtocol
    
    init(signupFormModelValidator: SignupFormModelValidatorProtocol , signupWebServiceProtocol: SignupWebServiceProtocol) {
        
        self.signupFormModelValidator = signupFormModelValidator
        self.signupWebServiceProtocol = signupWebServiceProtocol
    
    }
    
    func processSignup(model: SignupFormModel , signupWebServiceProtocol: SignupWebServiceProtocol){
        
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
        let fromModel = SignupFromRequestModel(firstName: model.firstName, lastName: model.lastName, email: model.email, password: model.password)
        signupWebServiceProtocol.signup(with: fromModel) { response, error in
            
        }
        
    }
}
