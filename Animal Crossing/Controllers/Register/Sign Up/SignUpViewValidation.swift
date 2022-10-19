//
//  SignUpViewValidation.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/24/20.
//

import Foundation
import UIKit
import ReactiveSwift
import ReactiveCocoa
import PubNub

extension SignUpViewController {
    func isValidForm() -> Bool {
        guard let emailText = emailTextField.text, !emailText.isEmpty else { return false }
        guard let passwordText = passwordTextField.text, !passwordText.isEmpty else { return false }
        guard let confirmPasswordText = confirmPasswordTextField.text, !confirmPasswordText.isEmpty else { return false }
        guard let usernameText = usernameTextField.text, !usernameText.isEmpty else { return false }
        return true
    }
    
    @objc func handleTextChange() {
        
        let emailText = emailTextField.text!
        let usernameText = usernameTextField.text!
        let passwordText = passwordTextField.text!
        let confirmPasswordText = confirmPasswordTextField.text!
        
        let isFormFilled = !emailText.isEmpty && !usernameText.isEmpty && !passwordText.isEmpty && !confirmPasswordText.isEmpty
        
        if isFormFilled {
            signUpButton.backgroundColor = UIColor(hexString: ColorHex.hex3.rawValue)
            signUpButton.isEnabled = true
        }else {
            signUpButton.backgroundColor = UIColor.lightGray
            signUpButton.isEnabled = false
        }
    }
    
    func setupSignUpViewModelBinding() {
        signUpButton.reactive.controlEvents(.touchUpInside).observeValues { [weak self] _ in
            guard let self = `self` else { return }
            self.errorLabel.text = ""
            if !self.isValidForm() {
                return
            }
            
            guard let username = self.usernameTextField.text,
                  let password = self.passwordTextField.text,
                  let email = self.emailTextField.text,
                  let confirmPasswordText = self.confirmPasswordTextField.text  else {
                return
            }
            let value = SignUpValue(username: username, email: email, password: password, confirmPassword: confirmPasswordText)
            self.viewModel.doSignUp(value: value)
        }
        
        viewModel.loginSignUpErrMessage.signal.observeValues { [weak self] (error) in
            guard let self = `self` else { return }
            if !error.isEmpty {
                self.errorLabel.isHidden = false
                self.errorLabel.text = error
            } else {
                self.delegate?.susscessSignUpLogin()
            }
        }
        
        loginButton.reactive.controlEvents(.touchUpInside).observeValues { [weak self] _ in
            guard let self = `self` else { return }
            self.handleSwitchView()
        }
        
    }
}
