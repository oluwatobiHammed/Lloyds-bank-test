//
//  MockPeopleNetwork.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 29/07/2021.
//

import XCTest
import RxSwift
import RxAlamofire
import Alamofire

@testable import DirectoryApp
class MockNetwork: BaseNetWorkProtocol {
    var isMakeAPIRequestObservableMethodCalled: Bool = false
    func makeAPIRequestObservable<T>(responseType: T.Type, url: String, urlSession: URLSessionConfiguration, method: HTTPMethod, params: [String : Any]?, encoding: ParameterEncoding) -> Observable<T> where T : Decodable, T : Encodable {
        let getPeopleReturnValue = PublishSubject<T>()
        
        return getPeopleReturnValue.asObserver().do(onSubscribed: {[weak self] in
            self?.isMakeAPIRequestObservableMethodCalled = true
            
        })
    }
    
    
    
   
    
  
    



}
