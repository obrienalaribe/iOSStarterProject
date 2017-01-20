//
//  RegisterView.swift
//  ChurchFinder
//
//  Created by mac on 1/15/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class AuthView: UIView {
    
    let inputsContainerView: UIView = {
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
    
    var inputsContainerHeightAnchor: NSLayoutConstraint?
    var nameTextFieldHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    
    convenience init(parent: UIView) {
        self.init(frame: parent.frame)
        backgroundColor = Asset.Styles.primary.color

        setupInputContainer()
        setupSegmentedControl()
        setupLoginRegBtn()
        setupNameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupLogo()

    }
    
    func setupInputContainer(){
        addSubview(inputsContainerView)
        
        inputsContainerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        inputsContainerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        inputsContainerView.widthAnchor.constraint(equalTo: widthAnchor, constant: -24).isActive = true
        
        inputsContainerHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 150)
        
        inputsContainerHeightAnchor?.isActive = true
        
        print(inputsContainerHeightAnchor)
    }
    
    func setupSegmentedControl(){
        addSubview(loginRegisterSegmentControl)
        
        loginRegisterSegmentControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginRegisterSegmentControl.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
        
        loginRegisterSegmentControl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterSegmentControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupNameTextField(){
        
        inputsContainerView.addSubview(nameTextField)
        
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
            
        nameTextFieldHeightAnchor?.isActive = true
        
        
        //seperator
        
        inputsContainerView.addSubview(nameSeperatorView)
        nameSeperatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        nameSeperatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeperatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        nameSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupLogo() {
        addSubview(logoView)
        
        logoView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoView.bottomAnchor.constraint(equalTo: loginRegisterSegmentControl.topAnchor, constant: -12).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 150).isActive
            = true
        logoView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupEmailTextField(){
        inputsContainerView.addSubview(emailTextField)
        
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameSeperatorView.bottomAnchor).isActive = true
        
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
            
        emailTextFieldHeightAnchor?.isActive = true
        
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
        addSubview(loginRegisterBtn)
        loginRegisterBtn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginRegisterBtn.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterBtn.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
}
