//
//  Strings.swift
//  ChurchFinder
//
//  Created by mac on 1/17/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation

enum StringResource {
    enum Auth {
        case login
        case register
        case nameHint
        case emailHint
        case passwordHint
        
        var text: String {
            switch self {
                case .login: return "Login"
                case .register: return "Register"
                case .nameHint: return "Name"
                case .emailHint: return "Email address"
                case .passwordHint: return "Password"
            }
        }
    }
    
    enum Church {
        case findBtn
        case requestPickupBtn
        
        var text: String{
            switch self {
            case .findBtn: return "Find Churches"
            case .requestPickupBtn: return "Request Pickup"
            }
        }
    }
    
    
}


extension String
{
    func trim() -> String{return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)}
}
