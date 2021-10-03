//
//  PeopleRouting.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 07/07/2021.
//

import Foundation
import RxSwift
import Alamofire

class VMRoute: VMRouteProtocol  {
        private let baseNetwork: BaseNetWorkProtocol!
        private var timeOut : TimeInterval = 30
        private lazy var urlSession: URLSessionConfiguration = {
            urlSession.requestCachePolicy = .returnCacheDataElseLoad
            urlSession.timeoutIntervalForResource = timeOut
            urlSession.timeoutIntervalForRequest = timeOut
            return urlSession
        }()
    
   init(baseNetwork: BaseNetWorkProtocol, urlSession: URLSessionConfiguration = .default) {
        self.baseNetwork = baseNetwork
        self.urlSession = urlSession
        
    }
    
    func getContent(url: String, id: Int) -> Observable<ApiResponse<ContentResponse>> {
        return baseNetwork.makeAPIRequestObservable(responseType: ApiResponse<ContentResponse>.self, url: url, urlSession: urlSession, method: .get, params: [:], encoding: URLEncoding.default)
    }
    
    func getContentList(url: String) -> Observable<ApiResponse<ContentListResponse>> {
        return baseNetwork.makeAPIRequestObservable(responseType: ApiResponse<ContentListResponse>.self, url: url, urlSession: urlSession, method: .get, params: [:], encoding: URLEncoding.default)
    }
    
    

}
