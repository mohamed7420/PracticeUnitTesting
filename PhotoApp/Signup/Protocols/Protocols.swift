//
//  Protocols.swift
//  PhotoApp
//
//  Created by Mohamed osama on 26/06/2022.
//

import Foundation

protocol SignupFormModelValidatorProtocol{
    func validateFirstName(firstName: String) -> Bool
    func validateLastName(lastName: String) -> Bool
    func validateEmail(email: String) -> Bool
    func validatePasswordMatching(password: String , re_password: String) -> Bool
}
