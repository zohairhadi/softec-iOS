//
//  User.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//

import Foundation

class User:Codable {
    var userId: String = ""
    var displayName: String = ""
    var address: String = ""
    var photoUri: String = ""
    var phoneNumber: String = ""
    
    init(userId:String, displayName: String,address:String,photoUri:String,phoneNumber:String) {
        self.userId = userId
        self.displayName = displayName
        self.address = address
        self.photoUri = photoUri
        self.phoneNumber = phoneNumber
    }
    
    init() {
        self.userId = ""
        self.displayName = ""
        self.address = ""
        self.photoUri = ""
        self.phoneNumber = ""
    }
}

class UserRegistrationRequest: Codable {
    var user: User = User()
    var email: String = ""
    var fcmToken: String = ""
    
    init(user: User, email: String, fmc: String){
        self.user = user
        self.email = email
        self.fcmToken = fmc
    }
}
