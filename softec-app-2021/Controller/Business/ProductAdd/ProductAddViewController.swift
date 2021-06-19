//
//  ProductAddViewController.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//
import UIKit

class RegularRegisterViewController: UIViewController {

    //MARK:- Variables and Constants
    var pageController: UIPageViewController?
    var pages: [Pages] = Pages.allCases
    var currentIndex: Int = 0
    var screenView = RegularRegisterView()
    var validation = Validation()

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
//
//        let isValidateName = self.validation.validateName(name: name)
//        if (isValidateName == false) {
//           errorText = "Incorrect Details"
//        }
//        let isValidateNumber = self.validation.validaPhoneNumber(phoneNumber: number)
//        if (isValidateNumber == false) {
//            errorText = "Incorrect Details"
//        }
////        let isValidateAddress = self.validation.validateAnyOtherTextField(otherField: address)
////        if (isValidateAddress == false) {
////            errorText = "Incorrect Address"
////        }
//
//        if errorText != "" {
//            createAlert(vc: self, title: "Error", message: errorText)
//        }

        if (screenView.nameTextField.hasText && screenView.numberTextField.hasText && screenView.addressTextField.hasText) {
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegularTabBarViewController") as? UITabBarController {

                //add code for forward data passing here

                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
        } else {
            createAlert(vc: self, title: "Error", message: "Please enter all entries correctly")
        }
    }
    
    //MARK:- Helper Functions
    private func configureScreen(){

        // configure screen
        screenView.configureScreen(view: self.view)
        
        // configure outlets
        screenView.nextButton.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
        screenView.cameraButton.addTarget(self, action: #selector(didTapOnCameraButton(_:)), for: .touchUpInside)
    }
}
