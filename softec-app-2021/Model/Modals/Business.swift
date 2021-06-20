//
//  Business.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import Foundation

enum BusinessProfileTypes: String {
    case BASIC = "BASIC"
    case PREMIUM = "PREMIUM"
}

class Business: Codable {
    var businessId: String = ""
    var businessName: String = ""
    var businessDescription: String = ""
    var businessLogo: String = ""
    var businessAddress: String = ""
    var businessPhoneNumber: String = ""
    var isBusinessApproved: Bool = false
    var businessProfileType: String = BusinessProfileTypes.BASIC.rawValue
    
    init(businessId: String, businessName: String, businessDescription: String, businessLogo: String, businessAddress: String, businessPhoneNumber: String, isBusinessApproved: Bool, businessProfileType: String) {
        self.businessId = businessId
        self.businessName = businessName
        self.businessDescription = businessDescription
        self.businessLogo = businessLogo
        self.businessAddress = businessAddress
        self.businessPhoneNumber = businessPhoneNumber
        self.isBusinessApproved = isBusinessApproved
        self.businessProfileType = businessProfileType
    }
    
    init() {
        self.businessId = ""
        self.businessName = ""
        self.businessDescription = ""
        self.businessLogo = ""
        self.businessAddress = ""
        self.businessPhoneNumber = ""
        self.isBusinessApproved = true
        self.businessProfileType = ""
    }
    
//    enum CodingKeys: String CodingKey {
//        case familyGroupId = "familyGroupId"
//        case familyName = "familyName"
//        case members = "members"
//        case elderlyGroups = "elderlyGroups"
//        case createdBy = "createdBy"
//        case subscriptionId = "subscriptionId"
//        case createdAt = "createdAt"
//        case familyJoiningPin = "familyJoiningPin"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        familyGroupId = try values.decodeIfPresent(String.self, forKey: .familyGroupId)
//        familyName = try values.decodeIfPresent(String.self, forKey: .familyName)
//        members = try values.decodeIfPresent([String].self, forKey: .members)
//        elderlyGroups = try values.decodeIfPresent([String].self, forKey: .elderlyGroups)
//        createdBy = try values.decodeIfPresent(String.self, forKey: .createdBy)
//        subscriptionId = try values.decodeIfPresent(String.self, forKey: .subscriptionId)
//        createdAt = try values.decodeIfPresent(Int.self, forKey: .createdAt)
//        familyJoiningPin = try values.decodeIfPresent(String.self, forKey: .familyJoiningPin)
//    }
//
//    init(){
//        self.familyGroupId = ""
//        self.familyName = ""
//        self.members = [""]
//        self.elderlyGroups = [""]
//        self.createdBy = ""
//        self.subscriptionId = ""
//        self.createdAt = 0
//        self.familyJoiningPin = ""
//    }
//
//    init(familyGroupId : String, familyName : String, members : [String], elderlyGroups : [String], createdBy : String, subscriptionId : String, createdAt : Int, familyJoiningPin : String){
//        self.familyGroupId = familyGroupId
//        self.familyName = familyName
//        self.members = members
//        self.elderlyGroups = elderlyGroups
//        self.createdBy = createdBy
//        self.subscriptionId = subscriptionId
//        self.createdAt = createdAt
//        self.familyJoiningPin = familyJoiningPin
//    }
}

class BusinessRegistrationRequest: Codable {
    var business: Business = Business()
    var fcmToken: String = ""
    
    init(bus: Business, email: String, fmc: String){
        self.business = bus
        self.fcmToken = fmc
    }
}
