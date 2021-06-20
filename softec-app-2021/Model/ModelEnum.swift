//
//  ModelEnum.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import Foundation
import Moya

class ChargeDeductRequest: Codable {
    var amount = Double()
    var currency = String()
    var description = String()
    var customerId = String()
    
    init() {
        self.amount = 200.0
        self.currency = "USD"
        self.description = "a"
        self.customerId = "1624157664608"
    }
}

enum APIModel: TargetType {
    
    //----------------------------//
    // USER AUTHENTICATION ROUTES //
    //----------------------------//
    case postUser(user: UserRegistrationRequest)
    case getUser(id: String)
    
    case postBusiness(business: BusinessRegistrationRequest)
    case getBusiness(id: String)
    
    case stripe(req: ChargeDeductRequest)
    
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
        
        case .stripe:
            return "/deduct_charge"
            
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
        case .stripe:
            return .post
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
            
        case let .stripe(req):
            return .requestJSONEncodable(req as Encodable)
        }
    }
    
    var headers: [String: String]? {
        let fcmToken = UserDefaults.standard.string(forKey: "FCM_TOKEN") ?? ""
        return ["Authorization": fcmToken, "platform": "iOS", "app_version": "1.7"]
    }
}
