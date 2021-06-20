//
//  BusinessRegisterViewController.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import UIKit

class BusinessRegisterViewController: UIViewController {

    //MARK:- Variables and Constants
    var pageController: UIPageViewController?
    var pages: [Pages] = Pages.allCases
    var currentIndex: Int = 0
    var screenView = BusinessRegisterView()
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
        
        let businessModel = BusinessDataModel()
        let idd = "\(Int(NSDate().timeIntervalSince1970))"
        
        if (screenView.nameTextField.hasText && screenView.numberTextField.hasText && screenView.addressTextField.hasText && screenView.businessTextField.hasText) {
//            showLoadingSpinner()
//            uploadProfilePic(picData: screenView.profilePicImageView.image!.jpegData(compressionQuality: 0.1)!, id: idd) { [self] (durl) in
//                businessModel.createBusiness(bus: BusinessRegistrationRequest(bus: Business(businessId: idd, businessName: screenView.nameTextField.text!, businessDescription: screenView.businessTextField.text!, businessLogo: durl.absoluteString, businessAddress: screenView.addressTextField.text!, businessPhoneNumber: screenView.numberTextField.text!, isBusinessApproved: false, businessProfileType: BusinessProfileTypes.BASIC.rawValue), email: "", fmc: UserDefaults.standard.string(forKey: "FCM_TOKEN")!), onCompletion: { (isCreated) in
//                    if isCreated {
//                        removeLoadingSpinner()
            var busDB = BusinessDBHandler()
            busDB.saveFamilyBusiness(newBusiness: Business(businessId: idd, businessName: screenView.nameTextField.text!, businessDescription: screenView.businessTextField.text!, businessLogo: "", businessAddress: screenView.addressTextField.text!, businessPhoneNumber: screenView.numberTextField.text!, isBusinessApproved: false, businessProfileType: BusinessProfileTypes.BASIC.rawValue), profilePic: "", pic: screenView.profilePicImageView.image!.jpegData(compressionQuality: 0.1)!)
            
                        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BusinessTabBarViewController") as? UITabBarController {

                            if let navigator = navigationController {
                                navigator.pushViewController(viewController, animated: true)
                            }
                        }
//                    } else {
//                        print("Business not uploaded")
//                    }
//                    removeLoadingSpinner()
//                })
        } else {
//            showLoadingSpinner()
            createAlert(vc: self, title: "Error", message: "Please enter all entries correctly")
        }
    }
    
    //MARK:- Helper Functions
    func configureScreen(){

        // configure screen
        screenView.configureScreen(view: self.view)
        
        // configure outlets
        screenView.nextButton.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
        screenView.cameraButton.addTarget(self, action: #selector(didTapOnCameraButton(_:)), for: .touchUpInside)
    }
}
