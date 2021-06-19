//
//  RegularRegisterView.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import UIKit

class RegularRegisterView: UIView {
    
    private let transparentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.428065002, green: 0.46864748, blue: 0.8870635629, alpha: 1)
        view.layer.cornerRadius = 8
        return view
    }()
    
    var titleLabel: UILabel = {
        var l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = l.font.withSize(27)
        l.text = NSLocalizedString("Registeration", comment: "Registeration")
        l.textAlignment = .center
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
    
    func configureScreen(view: UIView){
        view.addSubview(titleLabel)
//        <#view#>.topAnchor.constraint(equalTo: view.topAnchor, constant: <#value#>).isActive = true
//        <#view#>.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: <#value#>).isActive = true
//        <#view#>.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: <#value#>).isActive = true
//        <#view#>.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: <#value#>).isActive = true
    }
    
}
