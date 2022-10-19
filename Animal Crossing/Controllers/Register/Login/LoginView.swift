//
//  LoginView.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/25/20.
//

import Foundation
import UIKit
import SnapKit

extension LoginViewController {
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupTextFields(){
        setupErrorLabel()
        setupUsernameField()
        setupPasswordField()
    }
    
    func setupButtons() {
        setupLoginButton()
        setupSignUpButton()
    }
    
    func setupContainterView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .clear
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.width.equalToSuperview()
        }
    }
    
    func setupErrorLabel() {
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.text = ""
        errorLabel.textColor = .red
        errorLabel.font = ACUtils.defaultAppFont(fontSize: 14)
        errorLabel.isHidden = true
        containerView.addSubview(errorLabel)
        errorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(40)
            make.width.equalTo(300)
        }
    }
    
    func setupUsernameField() {
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = L10n.username
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        usernameTextField.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        containerView.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(errorLabel.snp.bottom).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(300)
        }
    }
    
    func setupPasswordField() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = L10n.password
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        passwordTextField.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        containerView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(usernameTextField.snp.bottom).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(300)
        }
    }
    
    func setupSignUpButton() {
        signUpButton.setTitle(L10n.signUp, for: .normal)
        signUpButton.setTitleColor(.lightGray, for: .normal)
        signUpButton.titleLabel?.font = ACUtils.defaultAppFont(fontSize: 12)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.layer.cornerRadius = 3
        containerView.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(300)
        }
    }
    
    func setupLoginButton() {
        loginButton.setTitle(L10n.login, for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = ACUtils.defaultAppFont(fontSize: 14)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.layer.cornerRadius = 3
        loginButton.backgroundColor = UIColor.lightGray
        containerView.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(300)
        }
    }
    
}
