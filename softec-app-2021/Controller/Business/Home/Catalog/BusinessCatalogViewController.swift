//
//  BusinessHomeViewController.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import UIKit

class BusinessCatalogViewController: UIViewController {

    //MARK:- Variables and Constants
    @IBOutlet weak var searchBar: UISearchBar!
    var screenView = BusinessCatalogView()

    //MARK:- View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureScreen()
        keyboardNoficiations()
    }
    
    //MARK:- objc Functions
    @objc func prodButtonPressed(_ sender: UIButton!){
        
    }
    
    @objc func catButtonPressed(_ sender: UIButton!){
        configureAddCatPopupView()
    }
    
    @objc func removeTransparentView(){
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.screenView.transparentView.alpha = 0.0
            self.screenView.joinFamilyView.subviews.forEach({ $0.removeFromSuperview() })
            self.screenView.joinFamilyView.frame = CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 0)
        }, completion: nil)
    }
    
    //MARK:- Helper Functions
    private func configureScreen(){

        // configure screen
        screenView.configureScreen(view: self.view, top: Float((searchBar.frame.height)))
        
        // set delegates
        screenView.categoryCollectionView.dataSource = self
        screenView.categoryCollectionView.delegate = self
        
        screenView.productsCollectionView.dataSource = self
        screenView.productsCollectionView.delegate = self
        
        // configure outlets
        screenView.categoryAddButton.addTarget(self, action: #selector(catButtonPressed(_:)), for: .touchUpInside)
        screenView.productAddButton.addTarget(self, action: #selector(prodButtonPressed(_:)), for: .touchUpInside)
    }
    
    private func configureAddCatPopupView(){
        screenView.transparentView.frame = self.view.frame
        self.view.addSubview(screenView.transparentView)
        screenView.transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        screenView.joinFamilyView.frame = CGRect(x: self.view.frame.minX, y: self.view.frame.maxY, width: self.view.frame.width, height: 0)
        self.view.addSubview(screenView.joinFamilyView)
        screenView.joinFamilyView.backgroundColor = .white
        screenView.joinFamilyView.layer.cornerRadius = 10
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        screenView.transparentView.addGestureRecognizer(tapgesture)
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.screenView.transparentView.alpha = 0.5
            self.screenView.joinFamilyView.frame = CGRect(x: self.view.frame.minX, y: self.view.frame.maxY, width: self.view.frame.width, height: -250)

            self.screenView.configureCatView()

        }, completion: nil)
    }
}
