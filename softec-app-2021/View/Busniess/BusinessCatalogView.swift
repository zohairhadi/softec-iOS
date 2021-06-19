//
//  BusinessHomeView.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import UIKit

class BusinessCatalogView: UIView {
    //MARK:- Views
    let transparentView = UIView()
    var joinFamilyView = UIView()
    var textFeildHeightAnchor: NSLayoutConstraint?
    
    var titleLabel: UILabel = {
        var l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = l.font.withSize(27)
        l.text = NSLocalizedString("Category", comment: "Category")
        l.textAlignment = .left
        l.textColor = .label
        return l
    }()
    
    var descLabel: UILabel = {
        var l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = l.font.withSize(27)
        l.text = NSLocalizedString("Add a Category", comment: "Add a Category")
        l.textAlignment = .left
        l.textColor = .label
        return l
    }()
    
    var titleLabel2: UILabel = {
        var l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = l.font.withSize(24)
        l.text = NSLocalizedString("Product", comment: "Product")
        l.textAlignment = .left
        l.textColor = .label
        return l
    }()
    
    var productAddButton: SmallCustomButton = {
        let button = SmallCustomButton(titleString: NSLocalizedString("Add", comment: "Add"), size: 18)
        return button
    }()
    
    var categoryAddButton: SmallCustomButton = {
        let button = SmallCustomButton(titleString: NSLocalizedString("Add", comment: "Add"), size: 18)
        return button
    }()

    
    private let addProductButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.9906952977, green: 0.777977407, blue: 0.7781293988, alpha: 1)
        button.setTitle("", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.white, for: .highlighted)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom: 0, right: 0)
        return button
    }()
    
    var categoryCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isPagingEnabled = true
        
        cv.backgroundColor = .clear
        let profileNib = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        cv.register(profileNib, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        return cv
    }()
    
    var productsCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
//        cv.isPagingEnabled = true
        
        cv.backgroundColor = .clear
        let profileNib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        cv.register(profileNib, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        return cv
    }()
    
    var catNameField: PaddedTextFeild = {
        var tf = PaddedTextFeild()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = NSLocalizedString("Category Name", comment: "Category Name")
        tf.backgroundColor = #colorLiteral(red: 0.9620737433, green: 0.9129571319, blue: 0.9864124656, alpha: 1)
        tf.layer.cornerRadius = 8
        return tf
    }()
    
    private var finalDescriptionLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = l.font.withSize(23)
        l.text = NSLocalizedString("Let's get started", comment: "Let's get started")
        l.textAlignment = .center
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.textColor = .black
        return l
    }()
    
    //MARK:- Functions
    
    func configureScreen(view: UIView, top: Float){
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(top) + 20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        
        view.addSubview(categoryAddButton)
        categoryAddButton.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(top) + 20).isActive = true
        categoryAddButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        categoryAddButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10).isActive = true
        categoryAddButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        view.addSubview(categoryCollectionView)
        categoryCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        categoryCollectionView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        view.addSubview(titleLabel2)
        titleLabel2.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 40).isActive = true
        titleLabel2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        titleLabel2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        
        view.addSubview(productAddButton)
        productAddButton.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 40).isActive = true
        productAddButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        productAddButton.leadingAnchor.constraint(equalTo: titleLabel2.trailingAnchor, constant: 10).isActive = true
        productAddButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        view.addSubview(productsCollectionView)
        productsCollectionView.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 10).isActive = true
        productsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
        productsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        productsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
    }
    
    func configureCatView(){

        self.joinFamilyView.addSubview(self.descLabel)
        self.descLabel.font = self.descLabel.font.withSize(23)
        self.descLabel.text = NSLocalizedString("Add a Category", comment: "Add a Category")
        self.descLabel.topAnchor.constraint(equalTo: self.joinFamilyView.topAnchor, constant: 60).isActive = true
        self.descLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.descLabel.leadingAnchor.constraint(equalTo: self.joinFamilyView.leadingAnchor, constant: 30).isActive = true
        self.descLabel.trailingAnchor.constraint(equalTo: self.joinFamilyView.trailingAnchor, constant: -30).isActive = true
        
        self.joinFamilyView.addSubview(self.catNameField)
        //save constraint for editing it later with keyboard
        self.textFeildHeightAnchor = self.catNameField.heightAnchor.constraint(equalToConstant: 40)
        self.textFeildHeightAnchor?.isActive = true
        self.catNameField.topAnchor.constraint(equalTo: self.descLabel.bottomAnchor, constant: 20).isActive = true
        self.catNameField.leadingAnchor.constraint(equalTo: self.joinFamilyView.leadingAnchor, constant: 30).isActive = true
        self.catNameField.trailingAnchor.constraint(equalTo: self.joinFamilyView.trailingAnchor, constant: -30).isActive = true
    }
}
