//
//  BusinessDataModel.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//
import UIKit
import Moya

class BusinessDataModel {
    
    let moyaService = MoyaProvider<APIModel>()
    let decoder = JSONDecoder()
    
    //create family member user
    func createBusiness(bus: BusinessRegistrationRequest, onCompletion: @escaping (_ isUserCreated: Bool) -> Void){
        var decodedUserData: User?
        moyaService.request(.postBusiness(business: bus)) { (result) in
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
    func getBusinessEntity(id: String, onCompletion: @escaping (_ user: Business?) -> Void){
        moyaService.request(.getBusiness(id: id)) { (result) in
            var decodedUserData: Business?
            switch result {
            case .success(let response):
                print("User entity: ",String(data: response.data, encoding: .utf8)!)
                // decode user response
                do{
                    decodedUserData = try self.decoder.decode(Business.self, from: response.data)
                }catch{
                    print(error)
                }
                
                onCompletion(decodedUserData)
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
