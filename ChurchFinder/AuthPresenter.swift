//
//  AuthPresenter.swift
//  ChurchFinder
//
//  Created by mac on 1/15/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
import SVProgressHUD


extension AuthController: AuthDelegateInterface {
    func authModuleWillRegisterUser() {
        print("show loader spining")
        mainView.alpha = 0.3
        self.dismissKeyboard()
        mainView.isUserInteractionEnabled = false
        SVProgressHUD.show()
        
    }
    
    func authModuleDidRegisterUser() {
        print("back from hardwork so present data to controller")
        
        let networkDelayTime = DispatchTime.now() + .seconds(5)
        DispatchQueue.main.asyncAfter(deadline: networkDelayTime, execute: {
            self.mainView.isUserInteractionEnabled = true
            SVProgressHUD.dismiss()
            self.mainView.alpha = 1
        })

    }
    
    func authModuleDidFailRegistration() {
        print("user failed registration")
        SVProgressHUD.dismiss()
     
    }
    
    func toggleAuth(){
        let title = mainView.loginRegisterSegmentControl.titleForSegment(at: mainView.loginRegisterSegmentControl.selectedSegmentIndex)
        mainView.loginRegisterBtn.setTitle(title, for: .normal)
        
        if mainView.loginRegisterSegmentControl.selectedSegmentIndex == 0 {
            mainView.registerContainerView.removeFromSuperview()
            mainView.setupLoginForm()
        }else{
            mainView.loginContainerView.removeFromSuperview()
            mainView.setupRegisterForm()
        }
    }

}

