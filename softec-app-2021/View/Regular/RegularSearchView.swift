//
//  RegularSearchView.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//

import UIKit
import GoogleMaps

class RegularSearchView: UIView {
    //MARK:- UIViews
    var titleLabel: UILabel = {
        var l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = l.font.withSize(27)
        l.text = NSLocalizedString("Registeration Regular", comment: "Registeration Regular")
        l.textAlignment = .center
        l.textColor = .white
        return l
    }()
    
    var googleMap: GMSMapView = {
        let view = GMSMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func configureScreen(view: UIView){
        view.addSubview(googleMap)
        googleMap.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        googleMap.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        googleMap.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        googleMap.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
//
//        view.addSubview(titleLabel)
//        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
//        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
}
