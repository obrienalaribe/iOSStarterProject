//
//  ChurchProfile.swift
//  ChurchFinder
//
//  Created by Obrien Alaribe on 15/02/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class ChurchProfile: UIView {
    
    let logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        label.text = "EFA"
        label.layer.cornerRadius = 50
        label.layer.masksToBounds = true
        label.textColor = Asset.Styles.secondary.color
        label.backgroundColor = Asset.Styles.tertiary.color
        return label
    }()
    
    let profileDashboard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Asset.Styles.primary.color
        return view
    }()
    
    let primaryProfileLabel : UIView = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.text = "Everlasting Fathers' Assembly"
        label.textColor = Asset.Styles.secondary.color

        return label
    }()
    
    let secondaryProfileLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.text = "LS4 2BB"
        label.textColor = Asset.Styles.secondary.color
        
        return label
    }()
    
    let resultOne: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.text = "LS4 2BB \n members"
        label.textColor = Asset.Styles.secondary.color
        
        return label

    }()
    
    let analyticsContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Asset.Styles.primary.color
        return view
    }()
    
    let callToActionBtn : UIButton = {
        let button = UIButton()
        button.setTitle(StringResource.Church.requestPickupBtn.text, for: .normal)
        button.setTitleColor(Asset.Styles.secondary.color, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Asset.Styles.primaryDark.color
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        return button
    }()
    
    let backBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named:"arrow"), for: .normal)
        btn.tintColor = Asset.Styles.secondary.color
        return btn
    }()
    
    var labelArray : Array<UIView>!
    
    convenience init(parent: UIView) {
        self.init(frame: parent.frame)
        backgroundColor = Asset.Styles.secondary.color
        
        setupProfileDashboard()
       
        setupLogoLabel()
        
        setupPrimaryProfileLabel()
        
        setupSecondaryProfilLabel()

        labelArray = [createLabel(withTitle: "23", subTitle: "Followers"), createLabel(withTitle: "34", subTitle: "members"), createLabel(withTitle: "34", subTitle: "buses")]
        let stackView = UIStackView(arrangedSubviews: labelArray)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        profileDashboard.addSubview(analyticsContainer)
        
        analyticsContainer.bottomAnchor.constraint(equalTo: profileDashboard.bottomAnchor).isActive = true
        
        analyticsContainer.widthAnchor.constraint(equalTo: profileDashboard.widthAnchor).isActive = true
        analyticsContainer.heightAnchor.constraint(equalTo: profileDashboard.heightAnchor, multiplier:1/4).isActive = true
        
        profileDashboard.addSubview(stackView)
        stackView.widthAnchor.constraint(equalTo: analyticsContainer.widthAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: analyticsContainer.heightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: analyticsContainer.bottomAnchor).isActive = true
        
        
        addSubview(callToActionBtn)
        callToActionBtn.topAnchor.constraint(equalTo: profileDashboard.bottomAnchor, constant: 100).isActive = true
        callToActionBtn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        callToActionBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        callToActionBtn.widthAnchor.constraint(equalTo: widthAnchor, constant: -24).isActive = true
        
        addSubview(backBtn)
        backBtn.topAnchor.constraint(equalTo: profileDashboard.topAnchor, constant:30).isActive = true
        backBtn.leftAnchor.constraint(equalTo: profileDashboard.leftAnchor, constant: 12).isActive = true
        

    }
    

    func setupProfileDashboard(){
        addSubview(profileDashboard)
        profileDashboard.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileDashboard.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        profileDashboard.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        profileDashboard.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundColor = Asset.Styles.secondary.color

    }

    func setupLogoLabel() {
        profileDashboard.addSubview(logoLabel)
        logoLabel.topAnchor.constraint(equalTo: profileDashboard.topAnchor, constant:50).isActive = true
        logoLabel.centerXAnchor.constraint(equalTo: profileDashboard.centerXAnchor).isActive = true
        logoLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logoLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupPrimaryProfileLabel(){
        profileDashboard.addSubview(primaryProfileLabel)
        primaryProfileLabel.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant:20).isActive = true
        primaryProfileLabel.centerXAnchor.constraint(equalTo: profileDashboard.centerXAnchor).isActive = true

    }
    
    func setupSecondaryProfilLabel(){
        profileDashboard.addSubview(secondaryProfileLabel)
        secondaryProfileLabel.topAnchor.constraint(equalTo: primaryProfileLabel.bottomAnchor, constant:10).isActive = true
        secondaryProfileLabel.centerXAnchor.constraint(equalTo: profileDashboard.centerXAnchor).isActive = true

    }

    
    func createLabel( withTitle title:String, subTitle:String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.text = "\(title) \n \(subTitle)"
        label.textColor = Asset.Styles.secondary.color
        return label

    }
    
    func createSeperator(){
        let view = UIView()
//        view.heightAnchor.constraint(equalToConstant: 1).isActive
    }
}
