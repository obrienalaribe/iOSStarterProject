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
        let title = mainView.loginRegisterSegmentControl.titleForSegment(at: mainView.loginRegisterSegmentControl.selectedSegmentIndex)
        mainView.loginRegisterBtn.setTitle(title, for: .normal)
        
        //change height of input container view
        mainView.inputsContainerHeightAnchor?.constant = mainView.loginRegisterSegmentControl.selectedSegmentIndex == 0 ? 100 : 150
        
        
        //change height of name field
        mainView.nameTextFieldHeightAnchor?.isActive = false
       
        
       mainView.nameTextFieldHeightAnchor = mainView.nameTextField.heightAnchor.constraint(equalTo: mainView.inputsContainerView.heightAnchor, multiplier: mainView.loginRegisterSegmentControl.selectedSegmentIndex == 0 ? 0 : 1/3)
     
        mainView.nameTextFieldHeightAnchor?.isActive = true

        print(mainView.nameTextFieldHeightAnchor)
      
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

