//
//  RegularCartView.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//
import UIKit

class RegularCartView: UIView {
    //MARK:- UIViews
    var titleLabel: UILabel = {
        var l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = l.font.withSize(27)
        l.text = NSLocalizedString("Cart", comment: "Cart")
        l.textAlignment = .center
        l.textColor = .label
        return l
    }()
    
    var orderButton: BigCustomButton = {
        let button = BigCustomButton(titleString: "Order", size: 18)
        return button
    }()
    
    var productsCollectionView = UICollectionView()
    
    func configureScreen(view: UIView){
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        view.addSubview(orderButton)
        orderButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        orderButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        orderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        orderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        let nib = UINib(nibName: "OrderListCollectionViewCell", bundle: nil)
        productsCollectionView.register(nib, forCellWithReuseIdentifier: "OrderListCollectionViewCell")
        view.addSubview(productsCollectionView)
        productsCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        productsCollectionView.bottomAnchor.constraint(equalTo: orderButton.topAnchor, constant: -40).isActive = true
        productsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        productsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
}
