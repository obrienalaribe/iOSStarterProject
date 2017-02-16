//
//  ChurchProfileController.swift
//  ChurchFinder
//
//  Created by Obrien Alaribe on 15/02/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class ChurchProfileController: UIViewController {


    var mainView : ChurchProfile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = ChurchProfile(parent: view)
        
        view.addSubview(mainView)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
