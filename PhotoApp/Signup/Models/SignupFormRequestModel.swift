//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Mohamed osama on 25/06/2022.
//

import Foundation

enum SignupError: Error{
    case responseModelParsingError
}

struct SignupFromRequestModel: Codable{
    
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    
}
