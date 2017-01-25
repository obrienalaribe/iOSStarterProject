//
//  RegisterView.swift
//  ChurchFinder
//
//  Created by mac on 1/15/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class AuthView: UIView {
    
    let registerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Styles.secondary.color
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let formContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Styles.tertiary.color
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let loginContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Styles.secondary.color
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    let logoView : UIImageView = {
        let iv = UIImageView()
        iv.image = Asset.Icon.logo.image
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var loginRegisterSegmentControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: [StringResource.Auth.login.text, StringResource.Auth.register.text])
        sc.selectedSegmentIndex = 1
        sc.tintColor = Asset.Styles.secondary.color
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    let loginRegisterBtn : UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = Asset.Styles.primaryDark.color
        btn.setTitle(StringResource.Auth.register.text, for: .normal)
        btn.setTitleColor(Asset.Styles.secondary.color, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        return btn
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = StringResource.Auth.nameHint.text
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let nameSeperatorView : UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Styles.tertiary.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = StringResource.Auth.emailHint.text
        tf.keyboardType = .emailAddress
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailSeperatorView : UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Styles.tertiary.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = StringResource.Auth.passwordHint.text
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var formHeightConstraint: NSLayoutConstraint?

    convenience init(parent: UIView) {
        self.init(frame: parent.frame)
        backgroundColor = Asset.Styles.primary.color

        setupFormView()
        setupRegisterContainer()
        setupSegmentedControl()
        setupLoginRegBtn()
        setupNameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupLogo()

    }
    
    func setupFormView(){
        addSubview(formContainerView)
        
        formContainerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        formContainerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        formContainerView.widthAnchor.constraint(equalTo: widthAnchor, constant: -24).isActive = true
        
        formHeightConstraint = formContainerView.heightAnchor.constraint(equalToConstant: 150)
        formHeightConstraint?.isActive = true
        
    }
    
    func setupRegisterContainer(){
        formContainerView.addSubview(registerContainerView)
        
        registerContainerView.centerXAnchor.constraint(equalTo: formContainerView.centerXAnchor).isActive = true
        
        registerContainerView.centerYAnchor.constraint(equalTo: formContainerView.centerYAnchor).isActive = true
        
        registerContainerView.widthAnchor.constraint(equalTo: formContainerView.widthAnchor).isActive = true
        
        registerContainerView.heightAnchor.constraint(equalTo: formContainerView.heightAnchor).isActive = true
        
    }
    
    
    func setupLoginContainer() {
        addSubview(loginContainerView)
        
        loginContainerView.centerXAnchor.constraint(equalTo: formContainerView.centerXAnchor).isActive = true
        
        loginContainerView.centerYAnchor.constraint(equalTo: formContainerView.centerYAnchor).isActive = true
        
        loginContainerView.widthAnchor.constraint(equalTo: formContainerView.widthAnchor).isActive = true
        
        loginContainerView.heightAnchor.constraint(equalTo: formContainerView.heightAnchor).isActive = true
    }
    
    func setupSegmentedControl(){
        addSubview(loginRegisterSegmentControl)
        
        loginRegisterSegmentControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginRegisterSegmentControl.bottomAnchor.constraint(equalTo: formContainerView.topAnchor, constant: -12).isActive = true
        
        loginRegisterSegmentControl.widthAnchor.constraint(equalTo: formContainerView.widthAnchor).isActive = true
        loginRegisterSegmentControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupNameTextField(){
        
        registerContainerView.addSubview(nameTextField)
        
        nameTextField.leftAnchor.constraint(equalTo: registerContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: registerContainerView.topAnchor).isActive = true
        
        nameTextField.widthAnchor.constraint(equalTo: registerContainerView.widthAnchor).isActive = true
        
        nameTextField.heightAnchor.constraint(equalTo: formContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        
        //seperator
        
        registerContainerView.addSubview(nameSeperatorView)
        nameSeperatorView.leftAnchor.constraint(equalTo: registerContainerView.leftAnchor).isActive = true
        nameSeperatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeperatorView.widthAnchor.constraint(equalTo: registerContainerView.widthAnchor).isActive = true
        
        nameSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupLogo() {
        addSubview(logoView)
        
        logoView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoView.bottomAnchor.constraint(equalTo: loginRegisterSegmentControl.topAnchor, constant: -12).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 145).isActive
            = true
        logoView.heightAnchor.constraint(equalToConstant: 145).isActive = true
    }
    
    func setupEmailTextField(forRegistration: Bool = true){

        if forRegistration == true {
            registerContainerView.addSubview(emailTextField)
            
            emailTextField.leftAnchor.constraint(equalTo: registerContainerView.leftAnchor, constant: 12).isActive = true
            emailTextField.heightAnchor.constraint(equalTo: registerContainerView.heightAnchor, multiplier: 1/3).isActive = true
            emailTextField.widthAnchor.constraint(equalTo: registerContainerView.widthAnchor).isActive = true
            emailTextField.topAnchor.constraint(equalTo: nameSeperatorView.bottomAnchor).isActive = true

            
            registerContainerView.addSubview(emailSeperatorView)
            emailSeperatorView.leftAnchor.constraint(equalTo: registerContainerView.leftAnchor).isActive = true
            emailSeperatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
            emailSeperatorView.widthAnchor.constraint(equalTo: registerContainerView.widthAnchor).isActive = true
            
            emailSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        }else{
            loginContainerView.addSubview(emailTextField)
            
            emailTextField.leftAnchor.constraint(equalTo: loginContainerView.leftAnchor, constant: 12).isActive = true
            emailTextField.heightAnchor.constraint(equalTo: loginContainerView.heightAnchor, multiplier: 1/2).isActive = true
            emailTextField.widthAnchor.constraint(equalTo: loginContainerView.widthAnchor).isActive = true
            emailTextField.topAnchor.constraint(equalTo: loginContainerView.topAnchor).isActive = true
            
            
            loginContainerView.addSubview(emailSeperatorView)
            emailSeperatorView.leftAnchor.constraint(equalTo: loginContainerView.leftAnchor).isActive = true
            emailSeperatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
            emailSeperatorView.widthAnchor.constraint(equalTo: loginContainerView.widthAnchor).isActive = true
            
            emailSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true


        }
        
    }
    
    func setupPasswordTextField(forRegistration: Bool = true){

        if forRegistration == true {
            registerContainerView.addSubview(passwordTextField)
            
            passwordTextField.leftAnchor.constraint(equalTo: registerContainerView.leftAnchor, constant: 12).isActive = true
            passwordTextField.topAnchor.constraint(equalTo: emailSeperatorView.bottomAnchor).isActive = true
            
            passwordTextField.widthAnchor.constraint(equalTo: registerContainerView.widthAnchor).isActive = true
            
            passwordTextField.heightAnchor.constraint(equalTo: registerContainerView.heightAnchor, multiplier: 1/3).isActive = true
        } else{
            loginContainerView.addSubview(passwordTextField)
            
            passwordTextField.leftAnchor.constraint(equalTo: loginContainerView.leftAnchor, constant: 12).isActive = true
            passwordTextField.topAnchor.constraint(equalTo: emailSeperatorView.bottomAnchor).isActive = true
            
            passwordTextField.widthAnchor.constraint(equalTo: loginContainerView.widthAnchor).isActive = true
            
            passwordTextField.heightAnchor.constraint(equalTo: loginContainerView.heightAnchor, multiplier: 1/2).isActive = true
        }
      
    }
    
    func setupLoginRegBtn(){
        addSubview(loginRegisterBtn)
        loginRegisterBtn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginRegisterBtn.topAnchor.constraint(equalTo: formContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterBtn.widthAnchor.constraint(equalTo: formContainerView.widthAnchor).isActive = true
        loginRegisterBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func setFormHeight(height: CGFloat){
        formHeightConstraint?.isActive = false
        formHeightConstraint = formContainerView.heightAnchor.constraint(equalToConstant: height)
        formHeightConstraint?.isActive = true

    }
    
    func setupLoginForm(){
        setFormHeight(height: 100)
        setupLoginContainer()
        setupEmailTextField(forRegistration: false)
        setupPasswordTextField(forRegistration: false)        
    }
    
    func setupRegisterForm(){
        setFormHeight(height: 150)
        setupRegisterContainer()
        setupNameTextField()
        setupEmailTextField()
        setupPasswordTextField()
    }
    
    
}
