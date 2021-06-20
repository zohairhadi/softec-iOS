//
//  Constants.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import UIKit
import FirebaseStorage

//APP CONSTANTS
struct Constants {
    
    static let APP_NAME = "Softec-app-2021"
    static let SERVER_PORT = "8090"
    static let REDIS_HOST = "localhost"
    static let REDIS_PORT = "6379"
    static let PAYLOAD_KEY = "payloadKey"
    
    /**
     * DATABASE
     */
    static let DEFAULT_DATABASE = "defaultDatabase"
    
    /**
     *STORAGE
     */
    static let DEFAULT_STORAGE_PATH = "/user_uploaded_media"
    
    /**
     *APP BASE URL
    */
    static let AWS_SERVER_BASE_URL = "http://ec2-3-82-115-216.compute-1.amazonaws.com:" + SERVER_PORT
    
    /**
     * STRIPE KEYS
     */
    static let STRIPE_PUBLIC_KEY = "pk_test_51HTVJZCHTux5UwvSj12PsypI4z9AR8KVmjJxMWfw4nDMG9ZLytYogdBYmFxnhQjrkuIFwrmQkcDb7VzDF98raED900FtcGrmTZ"
    static var STRIPE_SECRET_KEY = "sk_test_51HTVJZCHTux5UwvShTG8kwqWxwzMg7OSwcmYfVHsmWGKv2Mv2aN2bx6pTCpWPsJMqK7E17IiQPFhh5kfNiL6kKzD00CQmiMcT7"


    /**
     *SEGUES
     */
    struct SEGUES {
        static let OPTIONS_INVITE_MEMBER = "inviteMemberSegue"
        static let OPTIONS_SWITCH_ELDERLY = "switchElderlySegue"
        static let OPTIONS_QR_SCANNER = "qRScannerSegue"
        static let JOIN_FAMILY_GROUP = "joinFamilyGroupSegue"
        static let OPTIONS_SEARCH = "searchSegue"
        static let OPTIONS_SETTINGS = "settingsSegue"
        static let OPTIONS_MEMBER_REQUESTS = "memberRequestsSegue"
    }
    
    /**
     *USER PROFILE TYPES
     */
    struct PROFILE_TYPES {
        static let PROFILE_ADMIN = "ADMIN"
        static let PROFILE_ELDERLY = "ELDERLY"
        static let PROFILE_CAREGIVER = "CAREGIVER"
        static let PROFILE_FAMILY_MEMBER = "FAMILY_MEMBER"
    }
    
    /**
     *USER DEFAULTS
     */
    struct USER_DEFAULTS {
        
        static let SERVER_URL = "http://192.168.100.45:8090"
        
        static let FCM_TOKEN = "FCM_TOKEN"
        static let REQUEST_ID = "REQUEST_ID"
        
        static let USER_ID = "USER_ID"
        static let ADMIN_ID = "ADMIN_ID"
        static let USER_NAME = "USER_NAME"
        static let USER_SIGNUP_CONTACT = "USER_SIGNUP_CONTACT"
        static let ADMIN_RESPONSE_PENDING = "ADMIN_RESPONSE_PENDING"
        
        static let PROFILE_TYPE = "PROFILE_TYPE"
        static let PROFILE_PIC = "PROFILE_PIC"
        static let VERIFICATION_ID = "VERIFICATION_ID"
    }
    
    /**
     * ROUTES
     */
    struct ROUTES {
        // USER AUTHENTICATION ROUTES
        static let USER = "user"
        static let BUSINESS = "business"
        
        // MESSAGES
        static let SEND_MESSAGE = "send_message"
    }
}

// Create a root reference for fireabse storage
let firebaseStorageRef = Storage.storage().reference()

//MARK:- ENUM
//messgae type
enum MessageType: String {
    case TEXT = "TEXT"
    case IMAGE = "IMAGE"
    case VIDEO = "VIDEO"
    case FILE = "FILE"
//    case CONTACT = "CONTACT"
    case AUDIO = "AUDIO"
    case COMPOSED_IMAGE = "COMPOSED_IMAGE"
    case COMPOSED_VIDEO = "COMPOSED_VIDEO"
    case REMINDER = "REMINDER"
}

//home vc options
enum OptionsList: CaseIterable {
    case InviteToGroup
    case SwitchElderly
    case CreateFamilyGroup
    case JoinFamilyGroup
    case Search
    case Settings
    case MemberRequests
    
    var optionsTitle: String {
        switch self {
        case .InviteToGroup:
            return "Invite to group"
        case .SwitchElderly:
            return "Switch elderly"
        case .CreateFamilyGroup:
            return "Create Family Group"
        case .JoinFamilyGroup:
            return "Join a Family Group"
        case .Search:
            return "Search"
        case .Settings:
            return "Settings"
        case .MemberRequests:
            return "Member Requests"
        }
    }
}


//scroll pages
enum Pages: CaseIterable {
    case pageZero
    case pageOne
    case pageTwo
    case pageThree

    var descriptionLabel: String {
        switch self {
        case .pageZero:
            return "Create a family group to talk with your loved ones."
        case .pageOne:
            return "Add Family members and Caregivers."
        case .pageTwo:
            return "Share daily moments across all generations."
        case .pageThree:
            return "Help your Elderly, right from your phone."
        }
    }

    var titleImage: UIImage {
        switch self {
        case .pageZero:
            return UIImage(named: "Carousel-Flower-1")!
        case .pageOne:
            return UIImage(named: "Carousel-Flower-2")!
        case .pageTwo:
            return UIImage(named: "Carousel-Flower-3")!
        case .pageThree:
            return UIImage(named: "Carousel-Flower-4")!
        }
    }

    var index: Int {
        switch self {
        case .pageZero:
            return 0
        case .pageOne:
            return 1
        case .pageTwo:
            return 2
        case .pageThree:
            return 3
        }
    }
}
