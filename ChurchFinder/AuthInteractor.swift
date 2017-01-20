//
//  RegisterInteractor.swift
//  ChurchFinder
//
//  Created by mac on 1/15/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation

//Testable business logic
class AuthInteractor : AuthInterface {
    var delegate: AuthDelegateInterface!
    var dao: AuthInterface
    
    init(dao: AuthInterface) {
        self.dao = dao
    }
    
    func registerUserAction(user: User){
        //Validate user records with a class here
        if true {
           
            delegate.authModuleWillRegisterUser()
            dao.registerUserAction(user: user)

            print("Interactor is talking to third party entities")
            delegate.authModuleDidRegisterUser()
            return
        }
        
        //show error message
        delegate.authModuleDidFailRegistration()
        
    }
    
    func extra(){
        
    }
}
