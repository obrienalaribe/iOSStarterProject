//
//  LoginController.swift
//  ChurchFinder
//
//  Created by mac on 1/6/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class LoginController: UIViewController {
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let loginRegisterBtn : UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        btn.setTitle("Register", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        return btn
    }()
    
    let nameTextField: UITextField = {
       let tf = UITextField()
        tf.placeholder = "Name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let nameSeperatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email address"
        tf.keyboardType = .emailAddress
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailSeperatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let logoView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "logo")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        
        setupInputContainer()
        setupLogo()
        setupLoginRegBtn()
        setupNameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        self.hideKeyboardWhenTappedAround()

        NotificationCenter.default.addObserver(self, selector: #selector(self.raiseFormFields(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.dropFormFields(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func setupLogo() {
        view.addSubview(logoView)
        
        logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoView.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 150).isActive
         = true
        logoView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupInputContainer(){
        view.addSubview(inputsContainerView)
        
        inputsContainerView.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        
        inputsContainerView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func setupNameTextField(){
        
        inputsContainerView.addSubview(nameTextField)
        
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        inputsContainerView.addSubview(nameSeperatorView)
        nameSeperatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        nameSeperatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeperatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        nameSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupEmailTextField(){
        inputsContainerView.addSubview(emailTextField)
        
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameSeperatorView.bottomAnchor).isActive = true
        
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        inputsContainerView.addSubview(emailSeperatorView)
        emailSeperatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSeperatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeperatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        emailSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupPasswordTextField(){
        inputsContainerView.addSubview(passwordTextField)
        
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailSeperatorView.bottomAnchor).isActive = true
        
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
       
    }
    
    func setupLoginRegBtn(){
        view.addSubview(loginRegisterBtn)
        loginRegisterBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterBtn.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterBtn.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginRegisterBtn.addTarget(self, action: #selector(LoginController.loginHandler), for: .touchUpInside)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func loginHandler(){
        print("clicked me")
        
        guard let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text else {
            print("Form is not valid")
            return
        }
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user: FIRUser?, error) in
            
            if error != nil {
                print(error)
                return
            }
            //success
            
            let ref = FIRDatabase.database().reference(fromURL: "https://churchfinder-545c4.firebaseio.com/")
            let userRef = ref.child("users").childByAutoId()
            
            let values = ["name": name,  "email": email]
            userRef.updateChildValues(values, withCompletionBlock: { (error, ref) in
                if error != nil {
                    print(error)
                    return
                }
                
                print("saved user")
            })
            

        })
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
   }


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        print("dismissing")
        self.view.frame.origin.y = 0
        self.view.endEditing(true)
    }
    
    func raiseFormFields(notification: NSNotification) {
        self.view.frame.origin.y = -50
    }
    
    func dropFormFields(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
}
