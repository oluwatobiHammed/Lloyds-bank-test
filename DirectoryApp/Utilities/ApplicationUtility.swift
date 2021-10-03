//
//  ApplicationUtility.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 07/07/2021.
//

import Foundation


func vmLog(_ tag:String, message: Any?){
//    NSLog("\(tag): \(message)")
    debugPrint("\(tag): \(message ?? "nil")")
}
func vmLogEnviron(_ tag:String, message: Any?, environment:BuildEnvironment = BuildEnvironment.development){
    let currentEnviron = ApplicationUtility.buildEnvironment
    if currentEnviron.isBefore(environment: environment){
        vmLog(tag, message: message)
    }
}


enum BuildEnvironment: Int{
    case development = 1
    case staging = 2
    case production = 100
    
    func isBefore(environment: BuildEnvironment)-> Bool{
        return self.rawValue < environment.rawValue
    }
}

struct ApplicationProperties{
    let baseUrl: String = {
        if let infoDict = ApplicationUtility.infoDictionary{
            return infoDict["VMBaseUrl"] as! String
        }
        return ""
    }()
}

class ApplicationUtility {
    
    static let buildEnvironment: BuildEnvironment = {
        if let app_prop = ApplicationUtility.infoDictionary{
            let type = app_prop["VMBuildEnvironment"] as! String
            switch type{
            case "dev":
                return .development
            case "stage":
                return .staging
            default:
                return .production
            }
        }
        return .production
    }()
    
    static let applicationProperties: ApplicationProperties = {
        return ApplicationProperties()
    }()
    
    fileprivate static let infoDictionary: [String: Any]? = {
        return Bundle.main.infoDictionary
    }()
}
