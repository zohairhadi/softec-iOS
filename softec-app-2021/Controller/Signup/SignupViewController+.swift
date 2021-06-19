//
//  SignupViewController+.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import AuthenticationServices

//MARK:- Extension PageController
extension SignupViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentVC = viewController as? PageVC else {
            return nil
        }
        
        var index = currentVC.page.index
        if index == 0 {
            return nil
        }
        index -= 1
        let vc: PageVC = PageVC(with: pages[index])
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentVC = viewController as? PageVC else {
            return nil
        }
        
        var index = currentVC.page.index
        if index >= self.pages.count - 1 {
            return nil
        }
        index += 1
        let vc: PageVC = PageVC(with: pages[index])
        return vc
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return self.currentIndex
    }
}

//MARK:- Extension
extension SignupViewController: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        self.showLoadingSpinner()
        if let error = error {
            self.removeLoadingSpinner()
            print("Error: ",error.localizedDescription)
            return
        }
        guard let auth = user.authentication else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        
        Auth.auth().signIn(with: credentials) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Login Successful.\(String(describing: authResult?.description))")
                //This is where you should add the functionality of successful login
                //i.e. dismissing this view or push the home view controller etc
                
            }
        }
    }
    
    private func pushHomeScreenVC(isProfileRestored: Bool, user: AuthDataResult){
        if isProfileRestored {
//            //present Home VCs
//            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeScreenViewController") as? HomeScreenViewController {
//
//                if let navigator = self.navigationController {
//                    navigator.pushViewController(viewController, animated: true)
//                }
//            }
        }
    }
}
