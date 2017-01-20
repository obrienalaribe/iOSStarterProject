//
//  AuthDelegateInterface.swift
//  ChurchFinder
//
//  Created by mac on 1/15/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation

protocol AuthDelegateInterface {
    func authModuleWillRegisterUser()
    func authModuleDidRegisterUser()
    func authModuleDidFailRegistration()
    //authModuleWillToggle(segmentselected)
}
