//
//  User.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/24/20.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var username: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var password: String = ""
    
}

struct LoginValue {
    var usernameOrEmail: String
    var password: String
}

struct SignUpValue {
    var username: String
    var email: String
    var password: String
    var confirmPassword: String
}
