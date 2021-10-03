//
//  MockRoomRepo.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 08/08/2021.
//

import XCTest
import RxSwift
@testable import DirectoryApp

class MockContentRepo: IContentRepo {
   
    
    var isGetContentMethodCalled: Bool = false
    
    let vmRouteProtocol: VMRouteProtocol?
   
   
    init(vmRouteProtocol: VMRouteProtocol) {
       self.vmRouteProtocol = vmRouteProtocol
       
   }
    
    func getContent(id: Int) -> Observable<ApiResponse<ContentResponse>> {
        isGetContentMethodCalled = true
        return vmRouteProtocol!.getContent(url: RemoteApiConstants.Endpoints.getContent(id).stringValue, id: id)
    }
    
  

 

}
