//
//  SignupViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Mohamed osama on 28/06/2022.
//

import XCTest
@testable import PhotoApp

class SignupViewControllerTests: XCTestCase {
    
    var sut: SignupViewController!
    
    override func setUp() {
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: SignupViewController.self)) as? SignupViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testSignupViewController_WhenCreated_HaveARequiredEmptyTextFields() throws{
        let userNameTextField = try XCTUnwrap(sut.tfUserName , "The user name isn't connecting to it's property")
        let emailTextField = try XCTUnwrap(sut.tfEmail , "The email field isn't connecting to it's property")
        XCTAssertEqual(userNameTextField.text, "")
        XCTAssertEqual(emailTextField.text, "")
        
    }
    
    func testSignupViewController_WhenCreated_SignButtonIsExisitOrNot() throws{
        let btnSignup = try XCTUnwrap(sut.btnSignup)
        let actions = btnSignup.actions(forTarget: sut, forControlEvent: .touchUpInside)
        XCTAssertEqual(actions?.count, 1)
        XCTAssertEqual(btnSignup.tag, 0)
    }
    
    func testSignupViewController_WhenSignupButtonTapped_InvokeSignupProcess(){
        let mockSignupModelValidator = SignupFormModelValidator()
        let signupWebService = MockWebService()
        let delegate = MockSignupViewDelegate()
        let mockSignupPresenter = MockSignupPresenter(signupFormModelValidator: mockSignupModelValidator, signupWebServiceProtocol: signupWebService, signupViewDelegateProtocol: delegate)

        sut.presenter = mockSignupPresenter
        
        sut.btnSignup.sendActions(for: .touchUpInside)
        XCTAssertTrue(mockSignupPresenter.isProcessSignupCalled)
    }
}
