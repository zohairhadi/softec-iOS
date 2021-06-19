//
//  UIViewController+.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }

}

//MARK:- UIAvtivity incidcator extension
fileprivate var aView: UIView?

extension UIViewController {
    func showLoadingSpinner(){
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor(white: 0.1, alpha: 0.4)
        
        var indicator = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            indicator = UIActivityIndicatorView(style: .large)
        }
        indicator.color = .white
        indicator.center = aView!.center
        indicator.startAnimating()
        aView?.addSubview(indicator)
        self.view.addSubview(aView!)
        
    }
    
    func removeLoadingSpinner(){
        aView?.removeFromSuperview()
        aView = nil
    }
}
