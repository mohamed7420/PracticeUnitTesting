//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Mohamed osama on 26/06/2022.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol{
    
    //dependency injection
    private var signupFormModelValidator: SignupFormModelValidatorProtocol
    private var signupWebServiceProtocol: SignupWebServiceProtocol
    private weak var signupViewDelegateProtocol: SignupViewDelegateProtocol?
    
    required init(signupFormModelValidator: SignupFormModelValidatorProtocol , signupWebServiceProtocol: SignupWebServiceProtocol , signupViewDelegateProtocol: SignupViewDelegateProtocol) {
        
        self.signupFormModelValidator = signupFormModelValidator
        self.signupWebServiceProtocol = signupWebServiceProtocol
        self.signupViewDelegateProtocol = signupViewDelegateProtocol
    
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
            if let error = error{
                self.signupViewDelegateProtocol?.errorHandller(error: error)
            }else{
                self.signupViewDelegateProtocol?.successfullSignup()
            }
        }
        
    }
}
