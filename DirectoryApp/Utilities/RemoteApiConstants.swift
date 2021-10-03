//
//  RemoteApiConstants.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

//import Foundation
//
//struct RemoteApiConstants {
//    fileprivate static let BASE_URL = ApplicationUtility.applicationProperties.baseUrl+"raw/"
//
//    // MARK:- ROOM APIs
//    static let ROOM_URL = "https://pastebin.com/raw/TGnC5c8e"
//
//
//    // MARK:- PEOPLE APIs
//    static let PEOPLE_URL = "\(BASE_URL)kg02uve4"
//
//
//
//
//
//}
import Foundation

class RemoteApiConstants {
    
    enum Endpoints {
        fileprivate static let BASE_URL = ApplicationUtility.applicationProperties.baseUrl
        case getContentList
        case getContent(Int)
       
        var stringValue: String {
            switch self {
                 
            case .getContentList:
                return     Endpoints.BASE_URL + "contentList.json"
            case .getContent(let id):
                return    Endpoints.BASE_URL + "content/\(id).json"
            
            }
        }
        
    }
    
}


