//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Mohamed osama on 25/06/2022.
//

import Foundation

typealias Completion = (SignupResponseModel? , SignupError?) -> Void

class SignupWebService{
    private var urlSession: URLSession
    private var url: String
    
    init(url: String , urlSession: URLSession = .shared){
        self.url = url
        self.urlSession = urlSession
    }
    
    func signup(with model: SignupFromRequestModel , completion: @escaping Completion){
        guard let url = URL(string: url) else{
            //create a unit test to test that specific error meesage is returned URL is nil
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(model)
        
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            //TODO: write a unit test
            if let data = data , let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completion(signupResponseModel , nil)
            }else{
                //TODO: write unit testing
                completion(nil , error as? SignupError)
            }
        }
        
        dataTask.resume()
    }
}
