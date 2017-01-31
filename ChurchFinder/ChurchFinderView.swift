//
//  ChurchView.swift
//  ChurchFinder
//
//  Created by Obrien Alaribe on 31/01/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class ChurchFinderView: UIView {

    let findBtn : UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = Asset.Styles.primaryDark.color
        btn.setTitle(StringResource.Church.findBtn.text, for: .normal)
        btn.setTitleColor(Asset.Styles.secondary.color, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        return btn
    }()
    
    convenience init(parent: UIView) {
        self.init(frame: parent.frame)
        backgroundColor = Asset.Styles.secondary.color
        addSubview(findBtn)
        
        findBtn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        findBtn.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        findBtn.widthAnchor.constraint(equalTo: widthAnchor, constant: -24).isActive = true
        findBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    

    
}
