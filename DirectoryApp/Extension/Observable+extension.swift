//
//  Observable+extension.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 01/08/2021.
//

import Foundation
import  RxSwift

//extension Observable where Element == (HTTPURLResponse, Data){
//    fileprivate func expectingObject<T : Codable>(ofType type: T.Type) -> Observable<ApiResult<T, ApiErrorMessage>>{
//        return self.map{ (httpURLResponse, data) -> ApiResult<T, ApiErrorMessage> in
//            switch httpURLResponse.statusCode{
//            case 200 ... 299:
//                // is status code is successful we can safely decode to our expected type T
//                let object = try JSONDecoder().decode(type, from: data)
//                return .success(object)
//            default:
//                // otherwise try
//                let apiErrorMessage: ApiErrorMessage
//                do{
//                    // to decode an expected error
//                    apiErrorMessage = try JSONDecoder().decode(ApiErrorMessage.self, from: data)
//                } catch _ {
//                    // or not. (this occurs if the API failed or doesn't return a handled exception)
//                    apiErrorMessage = ApiErrorMessage(error_message: "Server Error.")
//                }
//                return .failure(apiErrorMessage)
//            }
//        }
//    }
//}
