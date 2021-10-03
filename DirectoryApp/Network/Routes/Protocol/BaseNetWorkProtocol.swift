//
//  VMUrlRouteProtocol.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

protocol BaseNetWorkProtocol {
    //MARK: function for URLSession takes
    func makeAPIRequestObservable<T: Codable>(responseType: T.Type, url: String,  urlSession: URLSessionConfiguration, method: HTTPMethod,params: [String : Any]?, encoding: ParameterEncoding) -> Observable<T>
}
