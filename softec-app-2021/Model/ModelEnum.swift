//
//  ModelEnum.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import Foundation
import Moya

enum APIModel: TargetType {
    
    //----------------------------//
    // USER AUTHENTICATION ROUTES //
    //----------------------------//
    case postUser(user: User)
    case getUser(id: String)
    
    case postBusiness(business: Business)
    case getBusiness(id: String)
    
    //variables
    var baseURL: URL {
        return URL(string: Constants.USER_DEFAULTS.SERVER_URL)!
    }
    
    var path: String {
        switch self {
        case .postUser:
            return "/" + Constants.ROUTES.USER
        case .getUser:
            return "/" + Constants.ROUTES.USER
            
        case .postBusiness:
            return "/" + Constants.ROUTES.BUSINESS
        case .getBusiness:
            return "/" + Constants.ROUTES.BUSINESS

        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postUser:
            return .post
        case .getUser:
            return .get
            
        case .postBusiness:
            return .post
        case .getBusiness:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .postUser(user):
            return .requestJSONEncodable(user as Encodable)
        case let .getUser(id):
            return .requestParameters(parameters: ["userId": id], encoding: URLEncoding.queryString)
            
        case let .postBusiness(business):
            return .requestJSONEncodable(business as Encodable)
        case let .getBusiness(id):
            return .requestParameters(parameters: ["businessId": id], encoding: URLEncoding.queryString)
        
//        case let .register(userRegistrationRequest):
//            return .requestJSONEncodable(userRegistrationRequest as Encodable)
//
//        case let .checkUserAvaliable(userId):
//            return .requestParameters(parameters: ["userId": userId], encoding: URLEncoding.queryString)
//
//        case let .getElderlyCode(fcmToken, deviceModel, deviceType):
//            return .requestParameters(parameters: ["fcmToken": fcmToken, "deviceModel": deviceModel, "deviceType": deviceType], encoding: URLEncoding.queryString)
//
//        case let .getUserEntity(userId):
//            return .requestParameters(parameters: ["userId": userId], encoding: URLEncoding.queryString)
//
//        case let .upadteUserProfile(userProfile):
//            return .requestJSONEncodable(userProfile as Encodable)
////            return .requestParameters(parameters: ["userProfile" : userProfile], encoding: JSONEncoding.default)
//
//        case let .deleteUserProfile(userId, deleteReason):
//            return .requestParameters(parameters: ["userId": userId, "deleteReason": deleteReason], encoding: URLEncoding.queryString)
//
//        case let .restoreUserProfile(userId, fcmToken):
//            return .requestParameters(parameters: ["userId": userId, "fcmToken": fcmToken], encoding: URLEncoding.queryString)
//
//        case let .validateElderlyBarCode(barcode, adminId):
//            return .requestParameters(parameters: ["barcode": barcode, "adminId": adminId], encoding: URLEncoding.queryString)
//
//        case let .createElderlyProfile(elderlyProfile):
//            return .requestJSONEncodable(elderlyProfile as Encodable)
//
//        case let .updateUserProfileCompletionRequest(updateUserprofileRequest):
//            return .requestJSONEncodable(updateUserprofileRequest as Encodable)
//
//
//        case let .createFamilyGroup(adminId, familyName):
//            return .requestParameters(parameters: ["adminId": adminId, "familyName": familyName], encoding: JSONEncoding.default)
//
//        case let .joinFamilyByCode(familyJoiningCode, userId):
//            return .requestParameters(parameters: ["familyJoiningCode": familyJoiningCode, "userId": userId], encoding: URLEncoding.queryString)
//
//        case let .getFamilyById(familyId):
//        return .requestParameters(parameters: ["familyId":familyId], encoding: URLEncoding.queryString)
//
//        case let .respondToJoinFamilyPendingRequest(requestResponse):
//            return .requestJSONEncodable(requestResponse as Encodable)
//
//        case let .getPendingRequests(adminId, familyId):
//            return .requestParameters(parameters: ["adminId":adminId, "familyId":familyId], encoding: URLEncoding.queryString)
//
//        case let .getJoinFamilyRequestStatus(userId, requestId):
//            return .requestParameters(parameters: ["userId":userId, "requestId":requestId], encoding: URLEncoding.queryString)
//
//
//        case let .createElderlyGroup(elderlyGroup):
//            return .requestJSONEncodable(elderlyGroup as Encodable)
//
//        case let .addNewElderlyDevice(newElderlyDevice):
//            return .requestJSONEncodable(newElderlyDevice as Encodable)
//
//        case let .getElderlyGroup(elderlyGroupId):
//            return .requestParameters(parameters: ["elderlyGroupId":elderlyGroupId], encoding: URLEncoding.queryString)
//
//
//        case let .sendMessage(message):
//            return .requestJSONEncodable(message as Encodable)
//
//
//        case let .createElderlyReminder(reminder, familyId, targetElderlyId):
//            return .requestCompositeParameters(bodyParameters: ["createdBy":reminder.createdBy, "date":reminder.date, "description":reminder.description, "lastModifiedAt":reminder.lastModifiedAt, "notifyInTheGroup":reminder.notifyInTheGroup, "remindBefore":reminder.remindBefore, "reminderId":reminder.reminderId, "reminderTime":reminder.reminderTime, "repeatFrequency":reminder.repeatFrequency], bodyEncoding: JSONEncoding.default, urlParameters: ["familyId":familyId,"targetElderlyId":targetElderlyId])
//
//        case let .getElderlyReminder(reminderId, elderlyId):
//            return .requestParameters(parameters: ["reminderId":reminderId, "elderlyId":elderlyId], encoding: URLEncoding.default)
//
//        case let .deleteReminder(reminderId):
//            return .requestParameters(parameters: ["reminderId":reminderId], encoding: URLEncoding.default)
//
//        case let .getAllRemindersForElderly(elderlyId):
//            return .requestParameters(parameters: ["elderlyId": elderlyId], encoding: URLEncoding.default)
//
//        case let .sendReminderAcknoweledgement(elderlyId, reminderId):
//            return .requestParameters(parameters: ["elderlyId":elderlyId, "reminderId":reminderId], encoding: URLEncoding.default)
//
//
//
//        case let .notifyElderlyForCall(notificationRequest):
//            return .requestJSONEncodable(notificationRequest as Encodable)
//
//        case let .notifyCallerForCallRejection(callerId, callToken):
//            return .requestParameters(parameters: ["callerId":callerId, "callToken":callToken], encoding: JSONEncoding.default)
//
//        case let .generateTokenForElderlyCalling(elderlyId):
//            return .requestParameters(parameters: ["elderlyId": elderlyId], encoding: URLEncoding.queryString)
//
//
//        case .test:
//            return .requestPlain
//
//        case let .checkIfOtherPersonIsAvailableForCall(userId):
//            return .requestParameters(parameters: ["userId":userId], encoding: URLEncoding.queryString)
//        case let .pingForInCall(callToken, userId):
//            return .requestParameters(parameters: ["callToken":callToken, "userId":userId], encoding: JSONEncoding.default)
//        case let .markUserAsInCall(callToken, userId):
//            return .requestParameters(parameters: ["callToken":callToken, "userId":userId], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        let fcmToken = UserDefaults.standard.string(forKey: "FCM_TOKEN") ?? ""
        return ["Authorization": fcmToken, "platform": "iOS", "app_version": "1.7"]
    }
}
