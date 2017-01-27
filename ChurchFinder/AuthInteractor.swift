//
//  RegisterInteractor.swift
//  ChurchFinder
//
//  Created by mac on 1/15/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation

class AuthInteractor {
    var delegate: AuthDelegateInterface!
    var dao: AuthInterface
    var requestValidator = AuthRequestValidator()
    
    init(dao: AuthInterface) {
        self.dao = dao
    }
    
    func register(user: User){

        if requestValidator.isRegistrationDetailsValid(user: user) {
            delegate.authModuleWillRegisterUser()

           dao.register(user: user, completionHandler: { (status) in
                print("Interactor is talking to third party entities")
                self.delegate.authModuleDidRegisterUser()

           })
           
            return
        }
        
        //show error message
        delegate.authModuleDidFailRegistration()
        
    }
    
    func login(user: User){
        
    }

}
