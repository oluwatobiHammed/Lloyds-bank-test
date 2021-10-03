//
//  MockVMRoute.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 29/07/2021.
//

import XCTest
import RxSwift
import RxAlamofire
import Alamofire
@testable import DirectoryApp

class MockVMRoute: VMRouteProtocol  {
    
    var isGeMethodCalled: Bool = false
    var baseNetwork: BaseNetWorkProtocol! = BaseNetWorkServices()
    private var timeOut : TimeInterval = 30
    private lazy var urlSession: URLSessionConfiguration = {
        urlSession.requestCachePolicy = .useProtocolCachePolicy
        urlSession.timeoutIntervalForResource = timeOut
        urlSession.timeoutIntervalForRequest = timeOut
        return urlSession
    }()


    func getContentList(url: String) -> Observable<ApiResponse<ContentListResponse>> {
        isGeMethodCalled = true
        return baseNetwork.makeAPIRequestObservable(responseType: ApiResponse<ContentListResponse>.self, url: url, urlSession: .default, method: .get, params: [:], encoding: URLEncoding.default)
        
    }
    
    func getContent(url: String, id: Int) -> Observable<ApiResponse<ContentResponse>> {
        isGeMethodCalled = true
        return baseNetwork.makeAPIRequestObservable(responseType: ApiResponse<ContentResponse>.self, url: url, urlSession: .default, method: .get, params: [:], encoding: URLEncoding.default)
    }
    
    
    
    
}
