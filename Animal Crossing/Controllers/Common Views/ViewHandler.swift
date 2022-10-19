//
//  ViewHandler.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/19/20.
//

import Foundation
import UIKit
import SnapKit

protocol ViewHandlerDelegate {
    var window: UIWindow { get }
    func redirect()
}

protocol LoginDelegate: class {
    func redirectToLogin()
    func redirectToSignUp()
    func susscessSignUpLogin()
}

protocol LogoutDelegate: class {
    func redirectToLogin()
}

class ViewHandler: ViewHandlerDelegate {
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func redirect() {
        if UserDefaults.standard.isLoggedIn() {
            redirectHomeCollectionView()
        } else {
            setLoginViewAsRoot()
        }
    }
    
    func redirectHomeCollectionView() {
        let homeVC = HomeCollectionViewController()
        homeVC.delegate = self
        let nav = UINavigationController(rootViewController: homeVC)
        nav.setNavigationBarHidden(false, animated: false)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
    
    func setLoginViewAsRoot() {
        let vc = LoginViewController()
        vc.delegate = self
        let nav = UINavigationController(rootViewController: vc)
        nav.setNavigationBarHidden(false, animated: false)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
    
    func setSignUpViewAsRoot() {
        let vc = SignUpViewController()
        vc.delegate = self
        let nav = UINavigationController(rootViewController: vc)
        nav.setNavigationBarHidden(false, animated: false)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}

extension ViewHandler: LoginDelegate, LogoutDelegate {
    func redirectToLogin() {
        setLoginViewAsRoot()
    }
    
    func redirectToSignUp() {
        setSignUpViewAsRoot()
    }
    
    func susscessSignUpLogin() {
        redirectHomeCollectionView()
    }
}

extension UserDefaults {

    // Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }

    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }

    // Save User Data
    func setUsername(value: String) {
        set(value, forKey: UserDefaultsKeys.username.rawValue)
        synchronize()
    }

    // Retrieve User Data
    func getUsername() -> String {
        return string(forKey: UserDefaultsKeys.username.rawValue) ?? ""
    }
}
