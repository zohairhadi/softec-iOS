//
//  UserRoutingModel.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//

import UIKit
import Moya

class UserDataModel {
    
    let moyaService = MoyaProvider<APIModel>()
    let decoder = JSONDecoder()
    var decodedUserData: User?
    
    //create family member user
    func createUser(user: UserRegistrationRequest, onCompletion: @escaping (_ isUserCreated: Bool) -> Void){
        moyaService.request(.postUser(user: user)) { (result) in
            switch result {
            case .success(let response):
//                print(String(data: response.data, encoding: .utf8)!)
                onCompletion(true)
                break

            case .failure(let error):
                print("Error while createing new user: \(error)")
                break
            }
        }
    }
    
    //get user entity
    func getUserEntity(id: String, onCompletion: @escaping (_ user: User?) -> Void){
        moyaService.request(.getUser(id: id)) { (result) in
            switch result {
            case .success(let response):
                print("User entity: ",String(data: response.data, encoding: .utf8)!)
                // decode user response
                do{
                    self.decodedUserData = try self.decoder.decode(User.self, from: response.data)
                }catch{
                    print(error)
                }
                
                onCompletion(self.decodedUserData)
                break
                
            case .failure(let error):
                print("Error while getting user entity: \(error)")
                break
            }
        }
    }
    
//    //delete user
//    func deleteUser(userId: String, deleteReason: String, onCompletion: @escaping (_ isUserDeleted: Bool) -> Void){
//        moyaService.request(.deleteUserProfile(userId: userId, deleteReason: deleteReason)) { (result) in
//            switch result {
//            case .success(let response):
////                print(String(data: response.data, encoding: .utf8)!)
//                onCompletion(true)
//                break
//
//            case .failure(let error):
//                print("Error while createing new user: \(error)")
//                break
//            }
//        }
//    }
    
//    //update user profile
//    func updateUser(userId: String, userName: String, userImageURL: String, onCompletion: @escaping (_ isUpdated: Bool) -> Void){
//        moyaService.request(.upadteUserProfile(userProfile: UpdateUserProfileRequest(id: userId, name: userName, imageURL: userImageURL))) { (result) in
//            switch result {
//            case .success(let response):
//                print(String(data: response.data, encoding: .utf8)!)
//                onCompletion(true)
//                break
//
//            case .failure(let error):
//                print("Error while createing new user: \(error)")
//                break
//            }
//        }
//    }
    
}
