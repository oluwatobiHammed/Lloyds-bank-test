//
//  VMUrlRoute.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 07/07/2021.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire


public class BaseNetWorkServices: BaseNetWorkProtocol {
    
    fileprivate var requestHeaders: HTTPHeaders {
        return [ "Accept": "application/json"]
    }

    
    
    func makeAPIRequestObservable<T>(responseType: T.Type, url: String, urlSession: URLSessionConfiguration, method: HTTPMethod = .get,params: [String : Any]?, encoding: ParameterEncoding = URLEncoding.default) -> Observable<T> where T : Codable {
        
        
        let manager = Alamofire.Session(configuration: urlSession)
        
        return manager.rx.request(method, url, parameters: params, encoding: encoding, headers: requestHeaders)
            .validate(statusCode: 200 ..< 499)
            .debug()
            .responseString()
            .flatMapLatest { (_, responseString) -> Observable<T> in
                do {
                    //check if the `responseString` contains the `errors` key, create a new json string with key `error`
                    //otherwise, create a new json string with key `data`
                    let jsonString = responseString.localizedCaseInsensitiveContains("errors") ?
                        try self.getJsonString(withKey: "error", forValue: responseString) :
                        try self.getJsonString(withKey: "data", forValue: responseString)
                    print("This si the json",jsonString)
                    //map the result of `jsonString` above to the `responseType`
                    let requestResponse = try responseType.mapTo(jsonString: jsonString)!
                    
                    //return result in `requestResponse` above in the `successHandler`
                    return Observable.just(requestResponse)
                    
                } catch let error {
                    throw error
                }
            }
        
        
    }
    
    
    
    
    fileprivate func getJsonString(withKey: String, forValue: String) throws -> String {
        let jsonStringDictionary = "{\"\(withKey)\": \(forValue)}"
        return jsonStringDictionary
    }
}
