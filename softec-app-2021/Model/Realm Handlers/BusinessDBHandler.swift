//
//  BusinessDBHandler.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//

import Foundation
import RealmSwift

class BusinessDBHandler {
    
    //to get instance of db
    let realm = try! Realm()
    var bus = RealmBusiness()
    
    func saveFamilyBusiness(newBusiness: Business, profilePic:String, pic: Data){
        bus = RealmBusiness()
        
        bus.businessId = newBusiness.businessId
        bus.businessName = newBusiness.businessName
        bus.businessDescription = newBusiness.businessDescription
        bus.businessLogo = newBusiness.businessLogo
        bus.businessAddress = newBusiness.businessAddress
        bus.businessPhoneNumber = newBusiness.businessPhoneNumber
        bus.isBusinessApproved = newBusiness.isBusinessApproved
        bus.businessProfileType = BusinessProfileTypes.BASIC.rawValue
        bus.businessPic = pic

        //save member in elderly group
//        self.selectedElderlyGroup.members.append(member)
        
        self.realm.beginWrite()
        self.realm.add(bus)
        try! self.realm.commitWrite() //save an obj
        print("Member saved in realm")
    
//        print(fetchMembers())
    }
    
    //This will return all members, including elderly
    func fetchBusiness() -> [RealmBusiness] {
        var toReturn = [RealmBusiness]()
        let members = realm.objects(RealmBusiness.self)
        for m in members {
            toReturn.append(m)
        }
        return toReturn
    }
    
    //This will return only members, excluding elderly
    func fetchOnlyBusiness() -> [RealmBusiness] {
        var toReturn = [RealmBusiness]()
        let members = realm.objects(RealmBusiness.self)
        for m in members {
            toReturn.append(m)
        }
        return toReturn
    }
    
    //Will return the current member details to be displayed in messagefeed
    func getBusinessAndProfilePic(id: String) -> [RealmBusiness] {
        var toReturn = [RealmBusiness]()
        let members = realm.objects(RealmBusiness.self)
        for m in members {
            if m.businessId == id {
                toReturn.append(m)
            }
        }
        return toReturn
    }
    
    func deleteBusiness(){
        realm.beginWrite()
        realm.delete(realm.objects(RealmBusiness.self))
        try! realm.commitWrite()

    }
    
//    func updateFamilyMember(userId: String, userName: String, userPic: Data?, userPicUrl: String){
//        let members = realm.objects(RealmUser.self).filter("userID = %@", userId)
//
//        let realm = try! Realm()
//        if let member = members.first {
//            try! realm.write {
//                if userName != "" {
//                    member.displayName = userName
//                }
//                if userPicUrl != "" {
//                    member.photoURI = userPicUrl
//                }
//                if let pic = userPic {
//                    member.photo = pic
//                }
//                print("updated user details")
//            }
//        }
//    }
    
    func getBusinessById(id: String) -> RealmBusiness? {
        let array = fetchBusiness()
        for member in array {
            if member.businessId == id {
                return member
            }
        }
        return nil
    }
    
//    func convertRealmToFamilyGroup(realmGroup: RealmFamilyGroup) -> FamilyGroup {
//        return FamilyGroup(familyGroupId: realmGroup.familyGroupId, familyName: realmGroup.familyName, members: [""], elderlyGroups: [""], createdBy: realmGroup.createdBy, subscriptionId: realmGroup.subscriptionId, createdAt: realmGroup.createdAt, familyJoiningPin: realmGroup.familyJoiningPin)
//    }
    
}
