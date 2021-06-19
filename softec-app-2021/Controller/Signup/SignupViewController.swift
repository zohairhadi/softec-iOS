//
//  ViewController.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import AuthenticationServices

class SignupViewController: UIViewController {
    
    //MARK:- Variables and Constants
    var pageController: UIPageViewController?
    var pages: [Pages] = Pages.allCases
    var currentIndex: Int = 0
    var screenView = SignupView()

    //MARK:- View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureScreen()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self

        //hide keyboard
        hideKeyboardWhenTappedAround()
    }
    
    //MARK:- objc Functions
    @objc func phoneButtonPressed(_ sender: UIButton!){
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OTPViewController") as? OTPViewController {

            //add code for forward data passing here

            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @objc func emailButtonPressed(_ sender: UIButton!){
//        GIDSignIn.sharedInstance().signIn()
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileTypeViewController") as? ProfileTypeViewController {

            //add code for forward data passing here

            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    //MARK:- Helper Functions
    private func configureScreen(){
//        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.navigationBar.isHidden = true

        //configure page controller
        setupPageController()

        // configure screen
        screenView.configureScreen(view: self.view)
        
        // configure outlets
        screenView.phoneButton.addTarget(self, action: #selector(phoneButtonPressed(_:)), for: .touchUpInside)
        screenView.emailButton.addTarget(self, action: #selector(emailButtonPressed(_:)), for: .touchUpInside)
    }
    
    private func setupPageController() {
        //custom page indicator
        let proxy = UIPageControl.appearance()
        proxy.pageIndicatorTintColor = UIColor.lightGray
        proxy.currentPageIndicatorTintColor = #colorLiteral(red: 0.5581660867, green: 0.4481821656, blue: 1, alpha: 1)
        
        //set pagevc initials
        self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageController?.dataSource = self
        self.pageController?.delegate = self
        self.pageController?.view.backgroundColor = .clear
        self.pageController?.view.frame = CGRect(x: 0,y: 0,width: self.view.frame.width,height: self.view.frame.height/2)

        //add pagevc to view
        self.addChild(self.pageController!)
        self.view.addSubview(self.pageController!.view)
        
        let initialVC = PageVC(with: pages[0])
        
        self.pageController?.setViewControllers([initialVC], direction: .forward, animated: true, completion: nil)
        self.pageController?.didMove(toParent: self)
    }
    
    func toggleButtonsInteraction(enabled: Bool){
//        phoneButton.isUserInteractionEnabled = enabled
//        emailButton.isUserInteractionEnabled = enabled
//        appleButton.isUserInteractionEnabled = enabled
    }
}
