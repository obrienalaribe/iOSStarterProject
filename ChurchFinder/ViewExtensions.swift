//
//  ViewExtensions.swift
//  ChurchFinder
//
//  Created by mac on 1/6/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

extension UIView {
    
    func addConstraintsWithFormat(_ format:String, views: UIView...){
        var viewsDictionary = [String: UIView]()
        
        //push all the views into a dictionary
        for(index, view) in views.enumerated() {
            let key = "v\(index)" //i.e v0, v1
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
    
}


extension UIColor {
    convenience init(r: CGFloat, g:CGFloat, b:CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha:1)
    }
}
