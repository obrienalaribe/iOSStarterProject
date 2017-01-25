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
        
        mainView.loginRegisterBtn.addTarget(self, action: #selector(AuthController.registerUserAction), for: .touchUpInside)
        
    }
    
    func addViewListeners(){
        self.hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.raiseFormFields(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.dropFormFields(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    func toggleAuth(){
        //TODO: Send this to presenter
        let title = mainView.loginRegisterSegmentControl.titleForSegment(at: mainView.loginRegisterSegmentControl.selectedSegmentIndex)
        mainView.loginRegisterBtn.setTitle(title, for: .normal)
        
        if mainView.loginRegisterSegmentControl.selectedSegmentIndex == 0 {
            mainView.registerContainerView.removeFromSuperview()
            mainView.setupLoginForm()
            //User will login
        }else{
            //User will register
            mainView.loginContainerView.removeFromSuperview()
            mainView.setupRegisterForm()
        }
        
        
        
    }
    
    func registerUserAction(){
        if let name = mainView.nameTextField.text, let email = mainView.emailTextField.text, let password = mainView.passwordTextField.text {
            let registeringUser = User(name: name, email: email, password: password)
            eventHandler.registerUserAction(user: registeringUser)
            return
        }       
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}


