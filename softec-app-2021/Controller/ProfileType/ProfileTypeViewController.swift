//
//  ProfileTypeViewController.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//
import UIKit

class ProfileTypeViewController: UIViewController {

    //MARK:- Variables and Constants
    
    private var isOldAdultSelected = false
    private var isNextButtonPresented = false
    
    private let  titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = l.font.withSize(49)
        l.text = NSLocalizedString("Create a…", comment: "Create a…")
        return l
    }()
    
    private let businessButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.9906952977, green: 0.777977407, blue: 0.7781293988, alpha: 1)
        button.contentMode = .left
        button.setTitle(NSLocalizedString("Business Account", comment: "Business Account"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(UIColor.black.withAlphaComponent(0.2), for: .highlighted)
        //button.titleEdgeInsets = UIEdgeInsets(top: 0, left:-85, bottom: 0, right: 0)
        button.titleLabel?.font = button.titleLabel?.font.withSize(30)

        button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark"), for: .selected)
        button.setTitleColor(.green, for: .selected)

        button.imageView?.tintColor = .white
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom: 0, right: 78)
        
        button.addTarget(self, action: #selector(oldAdultButtonPressed(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private let normalButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.9406285882, green: 0.8534393907, blue: 0.9828494191, alpha: 1)
        button.contentMode = .left
        button.setTitle(NSLocalizedString("Regular Account", comment: "Regular Account"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(UIColor.black.withAlphaComponent(0.2), for: .highlighted)
        button.titleLabel?.font = button.titleLabel?.font.withSize(30)
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            button.setImage(UIImage(systemName: "checkmark"), for: .selected)
            button.setTitleColor(.green, for: .selected)
        } else {
            // Fallback on earlier versions
        }
        button.imageView?.tintColor = .white
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom: 0, right: 80)
        
        button.addTarget(self, action: #selector(familyMemberButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private let nextButton: BigCustomButton = {
        let button = BigCustomButton(titleString: NSLocalizedString("Next", comment: "Next"), size: 18)
        button.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
//    private let flyingTickImage: UIImageView = {
//        let img = UIImageView()
//        img.translatesAutoresizingMaskIntoConstraints = false
//
//        return img
//    }()
    
    private let descriptionLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = l.font.withSize(12)
        l.numberOfLines = 0
        l.textAlignment = .center
        l.text = NSLocalizedString("Choose \'Family Member\' or \'Caregiver\' to create a new profile or log in to your profile. Then join a family group, or create a new group as administrator.", comment: "Choose \'Family Member\' or \'Caregiver\' to create a new profile or log in to your profile. Then join a family group, or create a new group as administrator.")
        l.minimumScaleFactor = 0.1
        return l
    }()
    
    var currentTitle : String?
    
    //MARK:- View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureScreen()
    }
    
    //MARK:- Button Outlets
    
    @objc func oldAdultButtonPressed(_ sender:UIButton!){
//        currentTitle = Profile_Type.ELDERLY.rawValue
        isOldAdultSelected = true
        //add next button to subview if its not already added
        if !isNextButtonPresented {
            isNextButtonPresented = true
            configureNextButton()
        }
        //add the custom selected button effect
        if isOldAdultSelected {
            businessButton.layer.borderWidth = 2.5
            businessButton.layer.borderColor = UIColor.red.cgColor
            
            //reset other buttons
            normalButton.layer.borderWidth = 0
//            caregiverButton.layer.borderWidth = 0
        }
    }
    
    @objc func familyMemberButtonPressed(_ sender: UIButton!){
        isOldAdultSelected = false
        //add next button to subview if its not already added
        if !isNextButtonPresented {
            isNextButtonPresented = true
            configureNextButton()
        }
        //add the custom selected button effect
        if !isOldAdultSelected {
            var selectedButton: UIButton!, selectedColor: CGColor!
            if sender == normalButton {
                currentTitle = "FAMILY_MEMBER"
                selectedButton = self.normalButton
                selectedColor = UIColor.purple.cgColor
//                caregiverButton.layer.borderWidth = 0
                
            }else{
                currentTitle = "CAREGIVER"
//                selectedButton = self.caregiverButton
                selectedColor =  UIColor.blue.cgColor
                normalButton.layer.borderWidth = 0
            }
            
            selectedButton.layer.borderWidth = 2.5
            selectedButton.layer.borderColor = selectedColor
                        
            businessButton.layer.borderWidth = 0
        }
        
    }
    
    @objc func nextButtonPressed(_ sender:UIButton!){
        //set user profile type
        UserDefaults.standard.setValue(currentTitle, forKey: Constants.USER_DEFAULTS.PROFILE_TYPE)
        
        if isOldAdultSelected == true {
//            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OldAdultQRViewController") as? OldAdultQRViewController {
//
//                if let navigator = navigationController {
//                    navigator.pushViewController(viewController, animated: true)
//                }
//            }

        }else {
//            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TermsViewController") as? TermsViewController {
//
//                if let navigator = navigationController {
//                    navigator.pushViewController(viewController, animated: true)
//                }
//            }
        }
    }
    
    //MARK:- Helper Functions
    
    private func configureScreen(){
        //add UI elements to screen
        //add title label
        view.addSubview(titleLabel)
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 62).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -62).isActive = true
        
        //add category buttons
        view.addSubview(businessButton)
        businessButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 23).isActive = true
        businessButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        businessButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        businessButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        view.addSubview(normalButton)
        normalButton.topAnchor.constraint(equalTo: businessButton.bottomAnchor, constant: 23).isActive = true
        normalButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        normalButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        normalButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true

        configureBtnImageEdgeInsetsAccToLang()
        
        //add helper labels
        view.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: normalButton.bottomAnchor, constant: 10).isActive = true
//        descriptionLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    private func configureBtnImageEdgeInsetsAccToLang(){
        //To check is App Lang is swedish, then update constraints
        if businessButton.titleLabel?.text! != "Elderly Member" {
            //oldAdultButton.titleEdgeInsets = UIEdgeInsets(top: 0, left:-75, bottom: 0, right: 0)
            businessButton.imageEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom: 0, right: 68)
            
            normalButton.titleEdgeInsets = UIEdgeInsets(top: 0, left:-33, bottom: 0, right: 0)
            normalButton.imageEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom: 0, right: 98)
            
        }
    }

    private func configureNextButton(){
        view.addSubview(nextButton)
        nextButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
    }
}
