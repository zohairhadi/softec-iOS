//
//  RealmModels.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//

import Foundation
import RealmSwift

class RealmUser: Object {
    @objc dynamic var userId: String = ""
    @objc dynamic var displayName: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var photoUri: String = ""
    @objc dynamic var photo: Data = Data()
    @objc dynamic var phoneNumber: String = ""
    
}

class RealmBusiness: Object {
    @objc dynamic var businessId: String = ""
    @objc dynamic var businessName: String = ""
    @objc dynamic var businessDescription: String = ""
    @objc dynamic var businessLogo: String = ""
    @objc dynamic var businessPic: Data = Data()
    @objc dynamic var businessAddress: String = ""
    @objc dynamic var businessPhoneNumber: String = ""
    @objc dynamic var isBusinessApproved: Bool = false
    @objc dynamic var businessProfileType: String = BusinessProfileTypes.BASIC.rawValue
}
