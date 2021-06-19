//
//  OTPViewController.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//
import UIKit
import FirebaseAuth

class OTPViewController: UIViewController{
    
    //MARK:- Variables and Constants
    private var otpContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private let  descriptionLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = l.font.withSize(22)
        l.text = NSLocalizedString("We have sent a verification code to you on SMS.\n\nPlease enter it if it doesn\"t fill automatically.", comment: "We have sent a verification code to you on SMS.\n\nPlease enter it if it doesn\"t fill automatically.")
        l.numberOfLines = 4
        l.minimumScaleFactor = 0.5
        l.lineBreakMode = .byWordWrapping
        l.textAlignment = .center
        return l
    }()
    
    private let transBackground: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        view.frame = CGRect(x: 0, y: 0, width: 343, height: 337)
        view.backgroundColor = .white

        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.24)
        view.layer.cornerRadius = 8
        return view
    }()
    
    var userPhoneNumber = ""
    private let otpStackView = OTPStackView()
    
    //MARK:- View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureScreen()
        hideKeyboardWhenTappedAround()
    }


    //MARK:- Helper Functions
    
    private func configureOTPTextField(){
//        view.addSubview(otpContainerView)
//        otpContainerView.heightAnchor.constraint(equalToConstant: 70).isActive = true
//        otpContainerView.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 74).isActive = true
//        otpContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48).isActive = true
//        otpContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48).isActive = true
//
//        view.addSubview(otpStackView)
//        otpStackView.delegate = self
//        otpStackView.heightAnchor.constraint(equalTo: otpContainerView.heightAnchor).isActive = true
//        otpStackView.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 50).isActive = true
//        otpStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        otpStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
    }
    
    private func configureScreen(){
        view.addSubview(transBackground)
        transBackground.widthAnchor.constraint(equalToConstant: 343).isActive = true
        transBackground.heightAnchor.constraint(equalToConstant: 337).isActive = true
        transBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
//        transBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        transBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
//        transBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        //configure otp text feild
        configureOTPTextField()

//        view.addSubview(descriptionLabel)
//        descriptionLabel.topAnchor.constraint(equalTo: otpContainerView.bottomAnchor, constant: 20).isActive = true
//        descriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
//        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
    
    func verifyOTP() {
        
        let otp = otpStackView.getOTP()
        guard let verificationId = UserDefaults.standard.string(forKey: Constants.USER_DEFAULTS.VERIFICATION_ID) else {return}
        let credentials = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: otp)
        
        Auth.auth().signIn(with: credentials) { (success, error) in
            if error == nil {
                print("Success, User signed in...")
                
            }
        }
    }
    
    private func pushHomeScreenVC(isProfileRestored: Bool, user: AuthDataResult){
        self.removeLoadingSpinner()
        
        if isProfileRestored {
            //present Home VCs
//            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeScreenViewController") as? HomeScreenViewController {
//
//                let user = user.user
//                viewController.userID = user.uid
//                viewController.userName = user.displayName
//                viewController.userEmail = " "
//                viewController.userPhoneNumber = user.phoneNumber
//                viewController.userProfilePicUri = user.photoURL
//                UserDefaults.standard.setValue(Constants.USER_DEFAULTS.USER_SIGNUP_CONTACT, forKey: user.phoneNumber!)
//
//                if let navigator = self.navigationController {
//                    navigator.pushViewController(viewController, animated: true)
//                }
//            }
        }
    }
}
