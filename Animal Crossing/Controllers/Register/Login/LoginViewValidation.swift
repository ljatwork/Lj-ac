//
//  LoginViewValidation.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/24/20.
//

import Foundation
import UIKit
import PubNub
import ReactiveSwift

extension LoginViewController {
    func isValidForm() -> Bool {
        guard let passwordText = passwordTextField.text, !passwordText.isEmpty else { return false }
        guard let usernameText = usernameTextField.text, !usernameText.isEmpty else { return false }
        return true
    }
    
    @objc func handleTextChange() {
        let usernameText = usernameTextField.text!
        let passwordText = passwordTextField.text!
        
        let isFormFilled = !usernameText.isEmpty && !passwordText.isEmpty
        
        if isFormFilled {
            loginButton.backgroundColor = UIColor(hexString: ColorHex.hex3.rawValue)
            loginButton.isEnabled = true
        }else {
            loginButton.backgroundColor = UIColor.lightGray
            loginButton.isEnabled = false
        }
    }
    
    func setupSignUpViewModelBinding() {
        loginButton.reactive.controlEvents(.touchUpInside).observeValues { [weak self] _ in
            guard let self = `self` else { return }
            
            if !self.isValidForm () {
                return
            }
            
            guard let usernameEmail = self.usernameTextField.text, let password = self.passwordTextField.text else {
                return
            }
            let value = LoginValue(usernameOrEmail: usernameEmail, password: password)
            self.viewModel.doLogin(value: value)
        }
        
        viewModel.loginSignUpErrMessage.signal.observeValues { [weak self] (error) in
            guard let self = `self` else { return }
            if !error.isEmpty {
                self.errorLabel.isHidden = false
                self.errorLabel.text = error
            } else {
                self.displayLoadingScreen()
                self.delegate?.susscessSignUpLogin()
            }
        }
        
        signUpButton.reactive.controlEvents(.touchUpInside).observeValues { [weak self] _ in
            guard let self = `self` else { return }
            self.handleSwitchView()
        }
    }
}
