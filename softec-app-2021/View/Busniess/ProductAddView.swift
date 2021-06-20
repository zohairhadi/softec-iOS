//
//  ProductAddView.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//
import UIKit

class ProductAddView: UIView {
    
    private let transparentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = #colorLiteral(red: , green: , blue: , alpha: 1)
        view.backgroundColor = UIColor(red: 0.428065002, green: 0.46864748, blue: 0.8870635629, alpha: 0.7)
        view.layer.cornerRadius = 8
        return view
    }()
    
    var picImageView: UIImageView = {
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
        l.text = NSLocalizedString("Add Product", comment: "Add Product")
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
    
    var descTextField: PaddedTextFeild = {
        var tf = PaddedTextFeild()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Number"
        tf.backgroundColor = #colorLiteral(red: 0.9620737433, green: 0.9129571319, blue: 0.9864124656, alpha: 1)
        tf.layer.cornerRadius = 8
        return tf
    }()
    
    var priceTextField: PaddedTextFeild = {
        var tf = PaddedTextFeild()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Address"
        tf.backgroundColor = #colorLiteral(red: 0.9620737433, green: 0.9129571319, blue: 0.9864124656, alpha: 1)
        tf.layer.cornerRadius = 8
        return tf
    }()
    
    var nextButton: BigCustomButton = {
        let button = BigCustomButton(titleString: NSLocalizedString("Register", comment: "Next"), size: 18)

        return button
    }()
    
    //MARK:- Functions
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
        transparentView.addSubview(picImageView)
        picImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        picImageView.centerXAnchor.constraint(equalTo: transparentView.centerXAnchor).isActive = true
        picImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        picImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true

        view.addSubview(cameraButton)
        cameraButton.layer.masksToBounds = false
        cameraButton.layer.cornerRadius = 45 / 2
        cameraButton.topAnchor.constraint(equalTo: picImageView.bottomAnchor, constant: -30).isActive = true
        cameraButton.leadingAnchor.constraint(equalTo: picImageView.trailingAnchor, constant: -20).isActive = true
        cameraButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        cameraButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        transparentView.addSubview(nameTextField)
        nameTextField.topAnchor.constraint(equalTo: picImageView.bottomAnchor, constant: 20).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: transparentView.leadingAnchor, constant: 10).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: transparentView.trailingAnchor, constant: -10).isActive = true
        
        transparentView.addSubview(descTextField)
        descTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        descTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        descTextField.leadingAnchor.constraint(equalTo: transparentView.leadingAnchor, constant: 10).isActive = true
        descTextField.trailingAnchor.constraint(equalTo: transparentView.trailingAnchor, constant: -10).isActive = true
        
        transparentView.addSubview(priceTextField)
        priceTextField.topAnchor.constraint(equalTo: descTextField.bottomAnchor, constant: 20).isActive = true
        priceTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        priceTextField.leadingAnchor.constraint(equalTo: transparentView.leadingAnchor, constant: 10).isActive = true
        priceTextField.trailingAnchor.constraint(equalTo: transparentView.trailingAnchor, constant: -10).isActive = true
        
        transparentView.addSubview(nextButton)
        nextButton.bottomAnchor.constraint(equalTo: transparentView.bottomAnchor, constant: -20).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: transparentView.leadingAnchor, constant: 28).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: transparentView.trailingAnchor, constant: -28).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
    }
}
