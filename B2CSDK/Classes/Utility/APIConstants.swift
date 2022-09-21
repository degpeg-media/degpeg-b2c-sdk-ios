//
//  APIConstants.swift
//  B2CFramework
//
//  Created by Raj Kadam on 17/05/22.
//

import Foundation

var DEFAULT_ContentPublisherId =  "6007cf41f2895e2eabcc2ac2"
var DEFAULT_ContentProviderId =  "6007cf41f2895e2eabcc2ac2"
var Current_User_Role: UserRoles = .publisher //"publisher"

public enum UserRoles{
    case publisher
    case provider
}
enum Channels {
    case dev
    case staging
    case live
    var StreamToWebsiteID: [String] {
        switch self {
        case .dev:
            return ["61d974e3cb6b7dc065bd0017", "6267d770f2700f724d939770", "6267a4fb6177e06dae10f972"]
        case .staging:
            return ["61d974e3cb6b7dc065bd0017", "6267d770f2700f724d939770", "6267a4fb6177e06dae10f972"]
        case .live:
            return ["61d974e3cb6b7dc065bd0017", "6267d770f2700f724d939770", "6267a4fb6177e06dae10f972"]
        }
    }
}


enum BaseURL {
    case dev
    case staging
    case live
    case test
    case dev1
    case liveWithJWT
    var apiURL: String {
        switch self {
        case .dev:
            return "https://dev.api.degpeg.com/" //"https://dev.degpeg.live/"//
        case .staging:
            return "https://staging.api.degpeg.com/"
        case .live:
            return "https://prod.api.degpeg.com/"
        case .liveWithJWT:
            return "https://prod1.api.degpeg.com/"
        case .test:
            return "https://test.api.degpeg.com/"
        case .dev1:
            return "https://dev1.api.degpeg.com/"
        }
    }
    
    var socketURL: String {
           switch self {
           case .dev:
               return "https://dev.interactionserver.degpeg.com:9014/"
           case .staging:
               return "https://prod.interactionserver.degpeg.com:9012/"
           case .live:
               return "https://prod.interactionserver.degpeg.com:9012/"
           case .liveWithJWT:
               return "https://prod1.interactionserver.degpeg.com:9015/"
           case .test:
               return "https://test.interactionserver.degpeg.com:9015/"
           case .dev1:
               return "https://dev.interactionserver.degpeg.com:9014/"
           }
       }
    
    var shareURL: String {
        switch self {
        case .dev:
            return "https://dev.client.degpeg.com/?"
        case .staging:
            return "https://dev.client.degpeg.com/?"
        case .live:
            return "https://client.degpeg.com/?"
        case .test:
            return "https://dev.client.degpeg.com/?"
        case .dev1:
            return "https://dev.client.degpeg.com/?"
        case .liveWithJWT:
            return "https://client.degpeg.com/?"
        }
    }

}

let BASE_ACCESS_TOKEN = ""
let CHANNELS: Channels = .live
let JWTEnabled = true
struct APIConstants {
    
    
    static let BaseUrl: BaseURL = .liveWithJWT
    static let AccessToken = "accessToken"
    static let JWT_TOKEN = "users/auth/token"
    
    static let ContentPublisher = "content-publishers"
    static let ContentProviders = "content-providers"
    static let Channels = "channels/"
    static let CategoriesList = "live-session-categories"
    
    static let LiveSessions = "live-sessions"
    static let Product = "products"
    static let UserDetail = "users"
    static let ViewCount = "views/count"
    static let UpdateViewCount = "views"
    static let LiveSessionComments = "chat-messages"
    static let LikeVideo = "likes"
    static let PurchaseCount = "/purchases/count"
}
