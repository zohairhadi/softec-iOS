//
//  PhoneNumberViewContoller.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//
import UIKit
import SKCountryPicker
import FirebaseAuth

class PhoneNumberViewContoller: UIViewController {

    //MARK:- Variables and Constants
    private let phoneImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "Phone") ?? #imageLiteral(resourceName: "Camera")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private let  descriptionLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = l.font.withSize(28)
        l.text = NSLocalizedString("Please enter your phone number for this account.", comment: "Please enter your phone number for this account.")
        l.lineBreakMode = .byWordWrapping
        l.numberOfLines = 2
        l.textAlignment = .center
        return l
    }()
    
    private let phoneNumberTextFeild: PaddedTextFeild = {
        let textFeild = PaddedTextFeild()
        textFeild.translatesAutoresizingMaskIntoConstraints = false
        textFeild.layer.cornerRadius = 15
        textFeild.backgroundColor = #colorLiteral(red: 0.9620737433, green: 0.9129571319, blue: 0.9864124656, alpha: 1)
        textFeild.addTarget(self, action: #selector(textFeildEditingChanged(_:)), for: .editingChanged)
        textFeild.font = textFeild.font!.withSize(25)
        textFeild.textContentType = .telephoneNumber
        textFeild.keyboardType = .numberPad
        textFeild.placeholder = "XXXXXXXXXXX"
        return textFeild
    }()
    
    private let countrySelectorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(countrySelectorButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private let countryDialingCodeLabel : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        lb.font = lb.font.withSize(16)
        lb.text = ""
        return lb
    }()
    
    private let nextButton: BigCustomButton = {
        let button = BigCustomButton(titleString: NSLocalizedString("Next", comment: "Next"), size: 18)
        button.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    var countryDialingCode = String()
    var completePhoneNumber = String()
    let userDefault = UserDefaults.standard
    
    //MARK:- View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCountryPicker()
        configureScreen()
        keyboardNoficiations()
    }
    
    //MARK:- Button Outlets
    
    @objc func nextButtonPressed(_ sender:UIButton!){
        //verify phone number and send otp
        verifyPhoneNumber()
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OTPViewController") as? OTPViewController {
            
            viewController.userPhoneNumber = completePhoneNumber
            
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @objc func textFeildEditingChanged(_ textField: UITextField) {
        if textField.text?.count == 10 {
            self.view.addSubview(self.nextButton)
            self.nextButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30).isActive = true
            self.nextButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 28).isActive = true
            self.nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -28).isActive = true
            self.nextButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
    }
    
    @objc func countrySelectorButtonPressed(_ sender: UIButton!) {
        _ = CountryPickerWithSectionViewController.presentController(on: self) { [weak self] (country: Country) in
            guard let self = self else { return }

            self.countryDialingCodeLabel.text = country.dialingCode
            self.countrySelectorButton.setImage(country.flag, for: .normal)
            self.countryDialingCode = country.dialingCode!
        }
        
    }
    
    //MARK:- Helper Functions
    
    private func configureScreen() {
        //add phone image
        view.addSubview(phoneImage)
        phoneImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -510).isActive = true
        phoneImage.heightAnchor.constraint(equalToConstant: 130).isActive = true
        phoneImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130).isActive = true
        phoneImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130).isActive = true
        
        view.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: phoneImage.bottomAnchor, constant: 55).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31).isActive = true
        
        view.addSubview(phoneNumberTextFeild)
        phoneNumberTextFeild.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50).isActive = true
        phoneNumberTextFeild.widthAnchor.constraint(equalToConstant: 190).isActive = true
        phoneNumberTextFeild.heightAnchor.constraint(equalToConstant: 55).isActive = true
        phoneNumberTextFeild.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        
        view.addSubview(countryDialingCodeLabel)
        countryDialingCodeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 60).isActive = true
        countryDialingCodeLabel.widthAnchor.constraint(equalToConstant: 48).isActive = true
        countryDialingCodeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        countryDialingCodeLabel.trailingAnchor.constraint(equalTo: phoneNumberTextFeild.trailingAnchor, constant: -200).isActive = true
        
        view.addSubview(countrySelectorButton)
        countrySelectorButton.topAnchor.constraint(equalTo: countryDialingCodeLabel.topAnchor).isActive = true
        countrySelectorButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        countrySelectorButton.heightAnchor.constraint(equalToConstant: 33).isActive = true
        countrySelectorButton.trailingAnchor.constraint(equalTo: countryDialingCodeLabel.trailingAnchor, constant: -50).isActive = true
        
    }

    private func configureCountryPicker() {
        guard let country = CountryManager.shared.currentCountry else {
            self.countrySelectorButton.setTitle(NSLocalizedString("Pick Country", comment: "Pick Country"), for: .normal)
            return
        }

        countryDialingCodeLabel.text = country.dialingCode
//        countrySelectorButton.setTitle(country.dialingCode, for: .normal)
        countrySelectorButton.setImage(country.flag, for: .normal)
        countrySelectorButton.clipsToBounds = true
        
        self.countryDialingCode = "+" + country.digitCountrycode!
    }
    
    private func verifyPhoneNumber() {
        guard let phoneNumber = phoneNumberTextFeild.text else {return}
        let areaCode = countryDialingCode
        completePhoneNumber = areaCode + phoneNumber
        
        PhoneAuthProvider.provider().verifyPhoneNumber(completePhoneNumber, uiDelegate: nil) { (verificationId, error) in
            if error == nil {
                print(verificationId!)
                guard let verifyID = verificationId else {return}
                self.userDefault.setValue(verifyID, forKey: Constants.USER_DEFAULTS.VERIFICATION_ID)
            }else{
                print("Unable to get secret verification code from firebase \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
}
