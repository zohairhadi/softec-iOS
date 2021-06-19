//
//  OTPViewController+.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import Foundation

//MARK:- Extension OTPDelegate
extension OTPViewController: OTPDelegate {
    
    func didChangeValidity(isValid: Bool) {
        
        if(isValid){
            //verify OTP and present new screen on success
            verifyOTP()
        }else{
            print("Not complete OTP")
        }
    }
}

