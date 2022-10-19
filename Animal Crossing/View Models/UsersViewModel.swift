//
//  UsersViewModel.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/24/20.
//

import Foundation
import ReactiveSwift
import RealmSwift

class UsersViewModel {
    var realm: Realm!
    var loginValue: LoginValue!
    var signUpValue: SignUpValue!
    var loginObserver = MutableProperty(())
    var signUpObserver = MutableProperty(())
    var loginSignUpErrMessage = MutableProperty("")
    var users: Results<User>!
    var isSignUp = false
    
    init(forSignUp: Bool) {
        isSignUp = forSignUp
        render()
    }
    
    func render() {
        do {
            realm = try Realm()
            users = realm.objects(User.self)
            if isSignUp {
                doSignUpAction()
            } else {
                doLoginAction()
            }
        } catch {
            fatalError("setting up view model")
        }
        
    }
    
    func doSignUpAction() {
        signUpObserver.signal.observeValues { [weak self] (_) in
            guard let self = `self` else {
                return
            }
            if self.isValidToSignUp() {
                let newUser = User()
                newUser.email = self.signUpValue.email
                newUser.username = self.signUpValue.username
                newUser.password = self.signUpValue.password
                UserDefaults.standard.setLoggedIn(value: true)
                UserDefaults.standard.setUsername(value: self.signUpValue.username)
                self.saveNewUser(userObject: newUser)
            }
            
        }
    }
    
    func doLoginAction() {
        loginObserver.signal.observeValues { [weak self] (_) in
            guard let self = `self` else {
                return
            }
            self.loginSignUpErrMessage.value = self.validateUsernameEmailPassword()
        }
    }
    
    func doLogin(value: LoginValue) {
        loginValue = value
        loginObserver.value = ()
    }
    
    func doSignUp(value: SignUpValue) {
        signUpValue = value
        signUpObserver.value = ()
    }
    
    func isValidToSignUp() -> Bool {
        var isValid = true
        var errMessage = ""
        if let err = signUpValue.username.validateUsernameCount() {
            errMessage.append(err.localized)
            isValid = false
        }
        
        if let err = usernameExist() {
            errMessage.append(err.localized)
            isValid = false
        }
        if let err = signUpValue.email.validateEmail() {
            errMessage.append(err.localized)
            isValid = false
        }
        if let err = emailExist() {
            errMessage.append(err.localized)
            isValid = false
        }
        
        if let err = signUpValue.confirmPassword.validateConfirmPassword(password: signUpValue.password) {
            errMessage.append(err.localized)
            isValid = false
        }
        
        if let err = signUpValue.password.validatePasswordCount() {
            errMessage.append(err.localized)
            isValid = false
        }
        self.loginSignUpErrMessage.value = errMessage
        return isValid
    }
    
    func validateUsernameEmailPassword() -> String {
        let userResult = users.first { (user) -> Bool in
            if (user.username == loginValue.usernameOrEmail || user.email == loginValue.usernameOrEmail) && user.password == loginValue.password {
                return false
            }
            return true
        }
        if userResult != nil {
            return LoginSignUpError.empty.localized
        }
        return LoginSignUpError.incorrectPassword.localized
    }
    
    func usernameExist() -> LoginSignUpError? {
        let userResult = users.first { (user) -> Bool in
            if (user.username == signUpValue.username) {
                return true
            }
            return false
        }
        if userResult != nil {
            return LoginSignUpError.usernameExist
        }
        return nil
    }
    
    func emailExist() -> LoginSignUpError? {
        let userResult = users.first { (user) -> Bool in
            if (user.email == signUpValue.email) {
                return true
            }
            return false
        }
        if userResult != nil {
            return LoginSignUpError.emailExist
        }
        return nil
    }
    
    private func saveNewUser(userObject: User) {
        do {
            try realm.write {
                realm.add(userObject)
            }
        } catch {
            fatalError("saving of user error")
        }
    }
    
    func deleteAllUsers() {
        do {
            realm = try Realm()
            try! realm.write {
                realm.deleteAll()
            }
        } catch {
            fatalError("setting up view model")
        }
    }
}
