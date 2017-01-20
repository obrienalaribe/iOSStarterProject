//
//  AuthPresenter.swift
//  ChurchFinder
//
//  Created by mac on 1/15/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

extension AuthController: AuthDelegateInterface {
    func authModuleWillRegisterUser() {
        print("show loader spining")
    }
    func authModuleDidRegisterUser() {
        print("back from hardwork so present data to controller")
    }
    func authModuleDidFailRegistration() {
        print("user failed registration")
    }
}

