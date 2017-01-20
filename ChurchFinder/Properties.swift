//
//  Properties.swift
//  ChurchFinder
//
//  Created by mac on 1/17/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit


enum Asset {
    enum Styles {
        case primary
        case secondary
        case tertiary
        
        case primaryDark
    
        var color: UIColor {
            switch self {
                case .primary: return UIColor(r: 61, g: 91, b: 151)
                case .secondary: return UIColor.white
                case .tertiary: return UIColor(r: 220, g: 220, b: 220)
                case .primaryDark: return UIColor(r: 80, g: 101, b: 161)
            }
        }
    }
    
    enum Icon {
        case logo
        case search
        case analytics
        
        var image: UIImage {
            switch self {
                case .logo: return UIImage(named: "logo")!
                case .search: return UIImage(named: "search")!
                case .analytics: return UIImage(named: "analytics")!
            }
        }

    }
}
