//
//  BusinessRegisterView.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//
import UIKit

class BusinessRegisterView: UIView {
    
    private let transparentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = #colorLiteral(red: , green: , blue: , alpha: 1)
        view.backgroundColor = UIColor(red: 0.428065002, green: 0.46864748, blue: 0.8870635629, alpha: 0.7)
        view.layer.cornerRadius = 8
        return view
    }()
    
    var profilePicImageView: UIImageView = {
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.masksToBounds = true
        img.clipsToBounds = true
        img.layer.cornerRadius = img.frame.width / 2
        img.image = UIImage(named: "blankProfile")!
        img.tintColor = .lightGray
        img.layer.borderWidth = 3
        img.layer.borderColor = UIColor.lightGray.cgColor
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    var cameraButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.white, for: .highlighted)
        button.setImage(UIImage(named: "Camera"), for: .normal)
        button.imageView?.tintColor = .black
        button.layer.cornerRadius = 5
        return button
    }()
    
    var titleLabel: UILabel = {
        var l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = l.font.withSize(27)
        l.text = NSLocalizedString("Registeration", comment: "Registeration")
        l.textAlignment = .center
        l.textColor = .white
        return l
    }()
    
    var nameTextField: PaddedTextFeild = {
        var tf = PaddedTextFeild()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Name"
        tf.backgroundColor = #colorLiteral(red: 0.9620737433, green: 0.9129571319, blue: 0.9864124656, alpha: 1)
        tf.layer.cornerRadius = 8
        return tf
    }()
    
    var numberTextField: PaddedTextFeild = {
        var tf = PaddedTextFeild()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Number"
        tf.backgroundColor = #colorLiteral(red: 0.9620737433, green: 0.9129571319, blue: 0.9864124656, alpha: 1)
        tf.layer.cornerRadius = 8
        return tf
    }()
    
    var addressTextField: PaddedTextFeild = {
        var tf = PaddedTextFeild()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Address"
        tf.backgroundColor = #colorLiteral(red: 0.9620737433, green: 0.9129571319, blue: 0.9864124656, alpha: 1)
        tf.layer.cornerRadius = 8
        return tf
    }()
    
    var businessTextField: PaddedTextFeild = {
        var tf = PaddedTextFeild()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Description"
        tf.backgroundColor = #colorLiteral(red: 0.9620737433, green: 0.9129571319, blue: 0.9864124656, alpha: 1)
        tf.layer.cornerRadius = 8
        return tf
    }()
    
    var nextButton: BigCustomButton = {
        let button = BigCustomButton(titleString: NSLocalizedString("Register", comment: "Next"), size: 18)
//        button.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    func configureScreen(view: UIView){
        view.addSubview(transparentView)
        transparentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        transparentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        transparentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        transparentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        transparentView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: transparentView.topAnchor, constant: 15).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: transparentView.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: transparentView.trailingAnchor, constant: -10).isActive = true
        
        //add views to subview with constraints
        transparentView.addSubview(profilePicImageView)
        profilePicImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        profilePicImageView.centerXAnchor.constraint(equalTo: transparentView.centerXAnchor).isActive = true
        profilePicImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        profilePicImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true

        view.addSubview(cameraButton)
        cameraButton.layer.masksToBounds = false
        cameraButton.layer.cornerRadius = 45 / 2
        cameraButton.topAnchor.constraint(equalTo: profilePicImageView.bottomAnchor, constant: -30).isActive = true
        cameraButton.leadingAnchor.constraint(equalTo: profilePicImageView.trailingAnchor, constant: -20).isActive = true
        cameraButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        cameraButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        transparentView.addSubview(nameTextField)
        nameTextField.topAnchor.constraint(equalTo: profilePicImageView.bottomAnchor, constant: 20).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: transparentView.leadingAnchor, constant: 10).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: transparentView.trailingAnchor, constant: -10).isActive = true
        
        transparentView.addSubview(numberTextField)
        numberTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        numberTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        numberTextField.leadingAnchor.constraint(equalTo: transparentView.leadingAnchor, constant: 10).isActive = true
        numberTextField.trailingAnchor.constraint(equalTo: transparentView.trailingAnchor, constant: -10).isActive = true
        
        transparentView.addSubview(addressTextField)
        addressTextField.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 20).isActive = true
        addressTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addressTextField.leadingAnchor.constraint(equalTo: transparentView.leadingAnchor, constant: 10).isActive = true
        addressTextField.trailingAnchor.constraint(equalTo: transparentView.trailingAnchor, constant: -10).isActive = true
        
        transparentView.addSubview(businessTextField)
        businessTextField.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 20).isActive = true
        businessTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        businessTextField.leadingAnchor.constraint(equalTo: transparentView.leadingAnchor, constant: 10).isActive = true
        businessTextField.trailingAnchor.constraint(equalTo: transparentView.trailingAnchor, constant: -10).isActive = true
        
        transparentView.addSubview(nextButton)
        nextButton.bottomAnchor.constraint(equalTo: transparentView.bottomAnchor, constant: -20).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: transparentView.leadingAnchor, constant: 28).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: transparentView.trailingAnchor, constant: -28).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
    }
}
