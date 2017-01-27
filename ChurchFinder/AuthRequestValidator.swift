//
//  AuthValidator.swift
//  ChurchFinder
//
//  Created by mac on 1/25/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation


class AuthRequestValidator {
    
    func emailIsValid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func isRegistrationDetailsValid(user: User) -> Bool {
        if let name = user.name, let email = user.email, let password = user.password {
            if emailIsValid(email: email){
                return (!name.trim().isEmpty && !email.trim().isEmpty && !password.trim().isEmpty)
            }
           
        }
        return false
    }
}
