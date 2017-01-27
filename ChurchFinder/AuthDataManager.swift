//
//  AuthDataManager.swift
//  ChurchFinder
//
//  Created by mac on 1/16/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation


class AuthDataManager : AuthInterface {
  
    func register(user: User, completionHandler: @escaping CompletionHandler) {
         let flag = true
        completionHandler(flag)

       
    }

    func login(user: User, completionHandler: @escaping CompletionHandler) {


    }



    
    
}
