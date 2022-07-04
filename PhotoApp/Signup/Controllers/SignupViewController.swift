//
//  SignupViewController.swift
//  PhotoApp
//
//  Created by Mohamed osama on 28/06/2022.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var btnSignup: UIButton!
    
    var presenter: SignupPresenterProtocol?
    let signupWebService = SignupWebService(url: "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users")

    override func viewDidLoad() {
        super.viewDidLoad()
    
        if presenter == nil{
            let signupModelValidator = SignupFormModelValidator()
            presenter = SignupPresenter(signupFormModelValidator: signupModelValidator, signupWebServiceProtocol: signupWebService, signupViewDelegateProtocol: self)
        }
    }
    

    @IBAction func btnSignupAction(_ sender: UIButton) {
        let model = SignupFormModel(firstName: "Mohamed", lastName: "Osama", email: "mohamed.osama9812@gmail.com", password: "mo128899", repeatPassword: "mo128899")
        
        presenter?.processSignup(model: model, signupWebServiceProtocol: signupWebService)
    }
    
}

extension SignupViewController: SignupViewDelegateProtocol{
    func successfullSignup() {
        
    }
    
    func errorHandller(error: SignupError?) {
        
    }
    
    
}
