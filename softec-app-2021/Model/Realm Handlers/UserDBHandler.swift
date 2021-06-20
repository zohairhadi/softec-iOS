//
//  UserDBHandler.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//

import Foundation
import RealmSwift

class UserDBHandler {
    
    //to get instance of db
    let realm = try! Realm()
    var user = RealmUser()
    

    func saveUser(newFamilyMember: User, profilePic:String, pic: Data){
        user = RealmUser()
        
        user.userId = newFamilyMember.userId
        user.displayName = newFamilyMember.displayName
        user.address = newFamilyMember.address
        user.phoneNumber = newFamilyMember.phoneNumber
        user.photoUri = profilePic
        user.photo = pic

        //save member in elderly group
//        self.selectedElderlyGroup.members.append(member)
        
        self.realm.beginWrite()
        self.realm.add(user)
        try! self.realm.commitWrite() //save an obj
        print("Member saved in realm")
    
//        print(fetchMembers())
    }
    
    //This will return all members, including elderly
    func fetchUsers() -> [RealmUser] {
        var toReturn = [RealmUser]()
        let members = realm.objects(RealmUser.self)
        for m in members {
            toReturn.append(m)
        }
        return toReturn
    }
    
    //This will return only members, excluding elderly
    func fetchOnlyUsers() -> [RealmUser] {
        var toReturn = [RealmUser]()
        let members = realm.objects(RealmUser.self)
        for m in members {
            toReturn.append(m)
        }
        return toReturn
    }
    
    //Will return the current member details to be displayed in messagefeed
    func getUserNameAndProfilePic(id: String) -> [RealmUser] {
        var toReturn = [RealmUser]()
        let members = realm.objects(RealmUser.self)
        for m in members {
            if m.userId == id {
                toReturn.append(m)
            }
        }
        return toReturn
    }
    
    func deleteFamilyUsers(){
        realm.beginWrite()
        realm.delete(realm.objects(RealmUser.self))
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
    
    func getUserById(id: String) -> RealmUser? {
        let array = fetchUsers()
        for member in array {
            if member.userId == id {
                return member
            }
        }
        return nil
    }
    
//    func convertRealmToFamilyGroup(realmGroup: RealmFamilyGroup) -> FamilyGroup {
//        return FamilyGroup(familyGroupId: realmGroup.familyGroupId, familyName: realmGroup.familyName, members: [""], elderlyGroups: [""], createdBy: realmGroup.createdBy, subscriptionId: realmGroup.subscriptionId, createdAt: realmGroup.createdAt, familyJoiningPin: realmGroup.familyJoiningPin)
//    }
    
}
