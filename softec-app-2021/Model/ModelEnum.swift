////
////  ModelEnum.swift
////  softec-app-2021
////
////  Created by Zohair Hadi on 19/06/2021.
////
//
//import Foundation
//import Moya
//
//enum APIModel: TargetType {
//    
//    //----------------------------//
//    // USER AUTHENTICATION ROUTES //
//    //----------------------------//
//    /**
//     * route to get elderly code
//     *
//     * @required: "fcmToken", "deviceModel" and "deviceType" as header parameters
//     * @note: provided elderly device info will later be used by the admin to add an elderly device
//     * @return: String containing the generated elderly code
//     */
//    case getElderlyCode(fcmToken: String, deviceModel: String, deviceType: String)
//    
//    /**
//     * route to check if a user is already available or not
//     * @required: "userId" as a parameter
//     * @return: Boolean indicating if the user is already available or not
//     */
//    case checkUserAvaliable(userId: String)
//    
//    /**
//     * route to get a user, given the id of that user, fcmToken passed will be treated as the new
//     * token for that user.
//     * @required: "userId" as a parameter
//     * @return: [models.user.User]
//     */
//    case getUserEntity(userId: String)
//    
//    /**
//     * route to register a new user
//     *
//     * @required: [models.user.UserRegistrationRequest]
//     * @return: Boolean indicating if the user was successfully added or not
//     */
//    case register(userRegistrationRequest: UserRegistrationRequest)
//    
//    /**
//     * route to validate the bar code for the elderly
//     *
//     * @required: "barcode", type String as a parameter
//     * @required: "adminId", Id of the admin who scanned the code
//     * @return: Boolean indicating if the bar code is still valid
//     */
//    case validateElderlyBarCode(barcode: String, adminId: String)
//    
//    /**
//     * route to get user profile restored
//     *
//     * @required: "userId" and fcmToken in header parameters
//     * @return: an object of type [models.user.RestoreUserResponse] with OK(200) code if successful,
//     * CONFLICT(409) otherwise with null response.
//     */
//    case restoreUserProfile(userId: String, fcmToken: String)
//    
//    /**
//     * route for deleting a user profile
//     *
//     * @note: you need to provide a delete reason here, which will be logged
//     * @required: "userId" and "deleteReason" in the header parameters
//     * @return: [Boolean] ack
//     */
//    case deleteUserProfile(userId: String, deleteReason: String)
//    
//    /**
//     * route for notifying server about profile completion status
//     *
//     * @required: userId in the form of [models.user.UpdateUserProfileCompletionRequest] in the request body
//     * @return: [Boolean] ack
//     */
//    case updateUserProfileCompletionRequest(updateUserprofileRequest: UpdateUserProfileCompletionRequest)
//    
//    /**
//     * route to update user profile
//     * @required: [models.UpdateUserProfileRequest]
//     * @return: Boolean, as an acknowledgment if the profile was updated or not
//     */
//    case upadteUserProfile(userProfile: UpdateUserProfileRequest)
//    
//    //--------------------------//
//    // FAMILY MANAGEMENT ROUTES //
//    //--------------------------//
//    /**
//     * route to create a family group
//     * @required: [models.CreateFamilyGroupRequest]
//     * @return: id of the newly created family group.
//     */
//    case createFamilyGroup(adminId: String, familyName: String)
//    
//    /**
//     * route to create the elderly profile
//     * @required: [models.CreateElderlyProfileRequest]
//     * @return: if the request is valid, it will return the elderlyId of the newly created elderly member.
//     * @Note: When the elderly profile is created successfully, the elderly device will be notified automatically.
//     */
//    case createElderlyProfile(elderlyProfile: CreateElderlyProfileRequest)
//
//    /**
//     * route for joining family using family code
//     *
//     * @required: "familyJoiningCode", type [Long] in the parameters
//     * @required: "userId", type [String] in the parameters
//     * @return: familyId against the joining code with the HttpStatusCode: OK(200), in case code is invalid,
//     * empty response is returned with HttpStatusCode: NotAcceptable(406)
//     */
//    case joinFamilyByCode(familyJoiningCode: String, userId: String)
//
//    /**
//     * route to get family group object by id
//     *
//     * @required: "familyId" of type [String] in parameters
//     * @return: if family exists, familyGroup of type [models.family.FamilyGroup] with HttpStatusCode: OK(200),
//     * if the id is invalid, then null with HttpStatusCode: NotAcceptable(406)
//     */
//    case getFamilyById(familyId: String)
//    
//    /**
//     * route to respond to pending join family requests
//     *
//     * @required: an object of type [models.family.JoinFamilyRequestAdminResponse] in the body
//     * @return: [Boolean]  ack
//    */
//    case respondToJoinFamilyPendingRequest(requestResponse:JoinFamilyRequestAdminResponse)
//    
//    /**
//     * route for getting all pending requests
//     *
//     * @required: "adminId" in header parameters
//     * @required: "familyId" in header parameters
//     * @return: List of objects of type [models.family.JoinFamilyPendingRequest]
//     */
//    case getPendingRequests(adminId: String, familyId: String)
//        
//    /**
//     * route for getting the current status on a join family pending request
//     *
//     * @required: "userId" and "requestId" in the header parameters
//     * @return: [models.family.JoinFamilyPendingRequest.RequestStatus]
//     */
//    case getJoinFamilyRequestStatus(userId: String, requestId: String)
//    
//    //---------------------------//
//    // ELDERLY MANAGEMENT ROUTES //
//    //---------------------------//
//    /**
//     * route for creating an elderly group
//     *
//     * @required: an object of type [models.elderly.ElderlyGroup] in the request body
//     * @return: [Boolean] ack
//     */
//    case createElderlyGroup(elderlyGroup: ElderlyGroup)
//    
//    /**
//      * route for creating an elderly device
//      *
//      * @required: an object of type [models.elderly.ElderlyDevice] in the request body
//      * @return: [Boolean] ack
//      */
//    case addNewElderlyDevice(newElderlyDevice: ElderlyDevice)
//    
//    /**
//     * route for getting an elderly group
//     *
//     * @required: "elderlyGroupId" in the header parameters
//     * @return: an object of type [models.elderly.ElderlyGroup]
//     */
//    case getElderlyGroup(elderlyGroupId: String)
//    
//    
//    //-----------------//
//    // MESSAGES ROUTES //
//    //-----------------//
//    /**
//     * receives incoming chat messages
//     * @required: object of type [models.message.Message] in the request body
//     * @required: 'familyId' as a parameter
//     * @return: a Boolean acknowledgement if the delivery was successful
//     */
//    case sendMessage(message: MessageSendModel)
//    
//    
//    //-----------------//
//    // REMINDER ROUTES //
//    //-----------------//
//    /**
//     * route for creating elderly remainder
//     * @required: "familyId" and "targetElderlyId" in parameters and [models.Reminder] in the body
//     * @return: acknowledgment[Boolean]
//     */
//    case createElderlyReminder(reminder: Reminder, familyId: String, targetElderlyId: String)
//
//    /**
//     * route for getting elderly remainder
//     *
//     * @required: "reminderId" and "elderlyId" in the request header as parameters
//     * @return: an object of type [models.Reminder] in case request is successful
//     */
//    case getElderlyReminder(reminderId: String, elderlyId: String)
//
//    /**
//     * route for deleting a reminder
//     *
//     * @required: "reminderId" in header parameters
//     * @return: [Boolean] ack
//     */
//    case deleteReminder(reminderId: String)
//
//    /**
//     * route for getting all routes for an elderly
//     *
//     * @required: "elderlyId" in header parameters
//     * @return an array of objects of type[models.Reminder]
//     */
//    case getAllRemindersForElderly(elderlyId: String)
//
//    /**
//     * route for sending ack when reminder is successfully received
//     *
//     * @required: "elderlyId" and "reminderId" in header parameters
//     * @return: [Boolean] ack
//     */
//    case sendReminderAcknoweledgement(elderlyId: String, reminderId: String)
//    
//    //----------------//
//    // CALLING ROUTES //
//    //----------------//
//    /**
//     * route for notifying elderly for the incoming call
//     * @required: [models.elderly.NotifyElderlyForCallRequest] in request body
//     * @return: acknowledgment[Boolean]
//     */
//    case notifyElderlyForCall(notificationRequest: NotifyElderlyForCallRequest)
//    
//    /**
//     * route for notifying elderly for the incoming call
//     * @required: "callerId", "callToken" in parameters
//     * @return: acknowledgment[Boolean]
//     */
//    case notifyCallerForCallRejection(callerId: String, callToken: String)
//    
//    /**
//     * route for getting token for elderly calling
//     * @required: "elderlyId" in parameters
//     * @return: token[String] for the call
//     */
//    case generateTokenForElderlyCalling(elderlyId: String)
//    
//    case checkIfOtherPersonIsAvailableForCall(userId: String)
//    
//    case pingForInCall(callToken: String, userId: String)
//    
//    case markUserAsInCall(callToken: String, userId: String)
//    
//    /**
//     *Shugal mela
//     */
//    case test
//    
//    
//    //variables
//    var baseURL: URL {
////        return URL(string: "http://192.168.0.125:8080")!
//        return URL(string: UserDefaults.standard.string(forKey: Constants.USER_DEFAULTS.SERVER_URL) ?? Constants.AWS_SERVER_BASE_URL)!
////        return URL(string: Constants.AWS_SERVER_BASE_URL)!
//    }
//    
//    var path: String {
//        switch self {
//        case .register:
//            return "/v1/" + Constants.ROUTES.REGISTER_NEW_USER
//        case .getElderlyCode:
//            return "/v1/" + Constants.ROUTES.GET_ELDERLY_CODE
//        case .checkUserAvaliable:
//            return "/v1/" + Constants.ROUTES.CHECK_IF_USER_ALREADY_AVAILABLE
//        case .getUserEntity:
//            return "/v1/" + Constants.ROUTES.GET_USER_ENTITY
//        case .deleteUserProfile:
//            return "/v1/" + Constants.ROUTES.DELETE_USER_PROFILE
//        case .restoreUserProfile:
//            return "/v1/" + Constants.ROUTES.RESTORE_USER_PROFILE
//        case .validateElderlyBarCode:
//            return "/v1/" + Constants.ROUTES.VALIDATE_ELDERLY_BAR_CODE
//        case .updateUserProfileCompletionRequest:
//            return "/v1/" + Constants.ROUTES.NOTIFY_SERVER_ABOUT_PROFILE_COMPLETION_STATUS
//        case .upadteUserProfile:
//            return "/v1/" + Constants.ROUTES.UPDATE_USER_PROFILE
//            
//        case .createFamilyGroup:
//            return "/v1/" + Constants.ROUTES.CREATE_FAMILY_GROUP
//        case .createElderlyProfile:
//            return "/v1/" + Constants.ROUTES.CREATE_ELDERLY_PROFILE
//        case .joinFamilyByCode:
//            return "/v1/" + Constants.ROUTES.JOIN_FAMILY_BY_CODE
//        case .getFamilyById:
//            return "/v1/" + Constants.ROUTES.GET_FAMILY_BY_ID
//        case .respondToJoinFamilyPendingRequest:
//            return "/v1/" + Constants.ROUTES.RESPOND_TO_JOIN_FAMILY_PENDING_REQUEST
//        case .getPendingRequests:
//            return "/v1/" + Constants.ROUTES.GET_PENDING_REQUESTS
//        case .getJoinFamilyRequestStatus:
//            return "/v1/" + Constants.ROUTES.GET_JOIN_FAMILY_REQUEST_STATUS
//
//        case .createElderlyGroup:
//            return "/v1/" + Constants.ROUTES.CREATE_ELDERLY_GROUP
//        case .addNewElderlyDevice:
//            return "/v1/" + Constants.ROUTES.ADD_NEW_ELDERLY_DEVICE
//        case .getElderlyGroup:
//            return "/v1/" + Constants.ROUTES.GET_ELDERLY_GROUP
//            
//        case .sendMessage:
//            return "/v1/" + Constants.ROUTES.SEND_MESSAGE
//            
//        case .createElderlyReminder:
//            return "/v1/" + Constants.ROUTES.CREATE_ELDERLY_REMINDER
//        case .getElderlyReminder:
//            return "/v1/" + Constants.ROUTES.GET_ELDERLY_REMINDER
//        case .deleteReminder:
//            return "/v1/" + Constants.ROUTES.DELETE_REMINDER
//        case .getAllRemindersForElderly:
//            return "/v1/" + Constants.ROUTES.GET_ALL_REMINDERS_FOR_ELDERLY
//        case .sendReminderAcknoweledgement:
//            return "/v1/" + Constants.ROUTES.SEND_REMINDER_ACKNOWLEDGEMENT
//
//        case .notifyElderlyForCall:
//            return "/v1/" + Constants.ROUTES.NOTIFY_ELDERLY_FOR_CALL
//        case .notifyCallerForCallRejection:
//            return "/v1/" + Constants.ROUTES.NOTIFY_CALLER_FOR_CALL_CANCELLATION
//        case .generateTokenForElderlyCalling:
//            return "/v1/" + Constants.ROUTES.GENERATE_TOKEN_FOR_CALLING
//        case .checkIfOtherPersonIsAvailableForCall:
//            return "/v1/" + Constants.ROUTES.CHECK_IF_PERSON_AVALIABLE_FOR_CALL
//        case .pingForInCall:
//            return "/v1/" + Constants.ROUTES.PING_FOR_IN_CALL
//        case .markUserAsInCall:
//            return "/v1/" + Constants.ROUTES.MARK_USER_IN_CALL
//
//        case .test:
//            return "/testDb"
//
//        }
//    }
//    
//    var method: Moya.Method {
//        switch self {
//        case .register:
//            return .post
//        case .createElderlyProfile:
//            return .post
//        case .checkUserAvaliable:
//            return .get
//        case .getElderlyCode:
//            return .get
//        case .getUserEntity:
//            return .get
//        case .deleteUserProfile:
//            return .delete
//        case .restoreUserProfile:
//            return .get
//        case .validateElderlyBarCode:
//            return .get
//        case .upadteUserProfile:
//            return .post
//        case .updateUserProfileCompletionRequest:
//            return .post
//            
//        case .createFamilyGroup:
//            return .post
//        case .joinFamilyByCode:
//            return .get
//        case .getFamilyById:
//            return .get
//        case .respondToJoinFamilyPendingRequest:
//            return .post
//        case .getPendingRequests:
//            return .get
//        case .getJoinFamilyRequestStatus:
//            return .get
//            
//        case .createElderlyGroup:
//            return .post
//        case .addNewElderlyDevice:
//            return .post
//        case .getElderlyGroup:
//            return .get
//            
//        case .sendMessage:
//            return .post
//            
//        case .createElderlyReminder:
//            return .post
//        case .getElderlyReminder:
//            return .get
//        case .deleteReminder:
//            return .delete
//        case .getAllRemindersForElderly:
//            return .get
//        case .sendReminderAcknoweledgement:
//            return .post
//            
//        case .notifyElderlyForCall:
//            return .post
//        case .notifyCallerForCallRejection:
//            return .post
//        case .generateTokenForElderlyCalling:
//            return .get
//        case .checkIfOtherPersonIsAvailableForCall:
//            return .get
//        case .pingForInCall:
//            return .post
//        case .markUserAsInCall:
//            return .post
//            
//        case .test:
//            return .get
//        }
//    }
//    
//    var sampleData: Data {
//        return Data()
//    }
//    
//    var task: Task {
//        switch self {
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
//        }
//    }
//    
//    var headers: [String: String]? {
//        let fcmToken = UserDefaults.standard.string(forKey: "FCM_TOKEN") ?? ""
//        return ["Authorization": fcmToken, "platform": "iOS", "app_version": "1.7"]
//    }
//}
