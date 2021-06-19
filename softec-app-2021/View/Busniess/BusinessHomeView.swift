//
//  BusinessHomeView.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import UIKit

class BusinessHomeView: UIView {
    
    var titleLabel: UILabel = {
        var l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = l.font.withSize(27)
        l.text = NSLocalizedString("Registeration", comment: "Registeration")
        l.textAlignment = .center
        l.textColor = .white
        return l
    }()
    
    func configureScreen(view: UIView){
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
}
