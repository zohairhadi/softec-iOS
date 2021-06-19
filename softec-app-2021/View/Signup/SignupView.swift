//
//  SignupView.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import UIKit

class SignupView: UIView {
    
    let signInLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = l.font.withSize(49)
        l.text = NSLocalizedString("Sign In", comment: "Sign In")
        l.textAlignment = .center
        return l
    }()
    
    var phoneButton: BigCustomButton = {

        let button = BigCustomButton(titleString: "Phone SMS", size: 18)
//        let button = BigCustomButton(color: UIColor(named: "CustomRedButtonColor") ?? #colorLiteral(red: 0.9906952977, green: 0.777977407, blue: 0.7781293988, alpha: 1), titleColor: UIColor(named: "CustomBlackWhiteColor") ?? .black, borderColor: .red, titleString: NSLocalizedString("Phone SMS", comment: "Phone SMS"), size: 33, img: btnImage)
//        button.titleLabel?.tintColor = UIColor(named: "CustomBlackWhiteColor") ?? .black
        return button
    }()
    
    var emailButton: BigCustomButton = {
        let button = BigCustomButton(titleString: "Gmail Account", size: 18)
//        let button = BigCustomButton(color: UIColor(named: "CustomBlueButtonColor") ?? #colorLiteral(red: 0.7777417898, green: 0.8124248385, blue: 0.9999200702, alpha: 1), titleColor: UIColor(named: "CustomBlackWhiteColor") ?? .black, borderColor: .blue, titleString: NSLocalizedString("", comment: "Gmail Account"), size: 33, img: btnImage)
//        button.titleLabel?.tintColor = UIColor(named: "CustomBlackWhiteColor") ?? .black
//        button.addTarget(self, action: #selector(emailButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    func configureScreen(view: UIView){

        //add buttons and label
        view.addSubview(signInLabel)
        signInLabel.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        signInLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
        signInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 85).isActive = true
        signInLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -85).isActive = true

        view.addSubview(phoneButton)
        phoneButton.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 15).isActive = true
        phoneButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        phoneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        phoneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true

        view.addSubview(emailButton)
        emailButton.topAnchor.constraint(equalTo: phoneButton.bottomAnchor, constant: 12).isActive = true
        emailButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        emailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        emailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
    }
}
