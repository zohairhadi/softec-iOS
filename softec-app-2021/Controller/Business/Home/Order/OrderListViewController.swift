//
//  OrderListViewController.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//

import UIKit

class OrderListViewController: UIViewController {

    //MARK:- Variables and Constants
    @IBOutlet weak var orderTypeSegmentButton: UISegmentedControl!

    var screenView = OrderListView()
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
        // configure screen
        screenView.configureScreen(view: self.view, top: 31)
        
        // set delegates
        screenView.ordersTable.dataSource = self
        screenView.ordersTable.delegate = self
        
//        // configure outlets
//        screenView.nextButton.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
    }
}
