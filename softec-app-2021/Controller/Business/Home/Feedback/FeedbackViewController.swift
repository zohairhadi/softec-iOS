//
//  FeedbackViewController.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//

import UIKit

class FeedbackViewController: UIViewController {

    //MARK:- Variables and Constants
    var feedbackTable: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        
        let nn = UINib(nibName: "FeedbackTableViewCell", bundle: nil)
        tb.register(nn, forCellReuseIdentifier: "FeedbackTableViewCell")
        return tb
    }()
    
    //MARK:- View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureScreen()
        hideKeyboardWhenTappedAround()
    }
    
    //MARK:- objc Functions
    @objc func nextButtonPressed(_ sender: UIButton!){
//        var errorText = ""
//        guard let name = screenView.nameTextField.text, let number = screenView.numberTextField.text, let address = screenView.addressTextField.text else{
//            createAlert(vc: self, title: "Error", message: "Please enter all entries correctly")
//            return
//        }
    }
    
    //MARK:- Helper Functions
    private func configureScreen(){

        view.addSubview(feedbackTable)
        feedbackTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        feedbackTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        feedbackTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        feedbackTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        // set delegates
        feedbackTable.dataSource = self
        feedbackTable.delegate = self
                
//        // configure outlets
//        screenView.nextButton.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
    }
}
