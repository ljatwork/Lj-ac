//
//  ACUtils+String.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/2/20.
//

import Foundation
import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: Bundle.main, value: "", comment: "")
    }
    
    func validateEmail() -> LoginSignUpError? {
        let firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegex = firstpart + "@" + serverpart + "[A-Za-z]{2,8}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        guard emailPredicate.evaluate(with: self) else {  return LoginSignUpError.invalidEmail }
        return nil
    }
    
    func validatePasswordCount() -> LoginSignUpError? {
        guard self.count > 3 else { return LoginSignUpError.shortPassword }
        guard self.count < 30 else { return LoginSignUpError.longPassword }
        return nil
    }
    
    func validateUsernameCount() -> LoginSignUpError? {
        guard self.count > 3 else { return LoginSignUpError.shortUsername }
        guard self.count < 10 else { return LoginSignUpError.longUsername }
        return nil
    }
    
    func validateConfirmPassword(password: String) -> LoginSignUpError? {
        guard self.count > 3 else { return LoginSignUpError.shortPassword }
        guard self.count < 30 else { return LoginSignUpError.longPassword }
        guard password == self else { return LoginSignUpError.passwordDidNotMatch }
        return nil
    }
}
