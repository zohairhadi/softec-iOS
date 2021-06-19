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

class Business {
    
    var businessId: String = ""
    var businessName: String = ""
    var businessDescription: String = ""
    var businessLogo: String = ""
    var businessAddress: String = ""
    var businessPhoneNumber: String = ""
    var isBusinessApproved: Bool = false
    var businessProfileType: BusinessProfileTypes = .BASIC
    
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

