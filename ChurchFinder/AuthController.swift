//
//  RegisterController.swift
//  ChurchFinder
//
//  Created by mac on 1/15/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class AuthController: UIViewController {
    let eventHandler = AuthInteractor(dao: AuthDataManager())
    var mainView : AuthView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventHandler.delegate = self
        addViewListeners()
        mainView = AuthView(parent: self.view)
        self.view.addSubview(mainView)
       
        mainView.loginRegisterSegmentControl.addTarget(self, action: #selector(AuthController.toggleAuth), for: .valueChanged)
        
        mainView.loginRegisterBtn.addTarget(self, action: #selector(AuthController.loginRegisterAction), for: .touchUpInside)
        
    }
    
    func addViewListeners(){
        self.hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.raiseFormFields(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.dropFormFields(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
 
    
    func loginRegisterAction(){
         let userDetails = User(name: mainView.nameTextField.text, email: mainView.emailTextField.text, password: mainView.passwordTextField.text)

        if mainView.loginRegisterSegmentControl.selectedSegmentIndex == 0 {
            eventHandler.login(user: userDetails)
        }else{
            eventHandler.register(user: userDetails)
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}


