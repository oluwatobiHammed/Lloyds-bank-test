//
//  RoomRepoImpl.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift


struct ContentRepoImpl: IContentRepo {
  
    
 
     let vmRouteProtocol: VMRouteProtocol?
    
    
     init(vmRouteProtocol: VMRouteProtocol) {
        self.vmRouteProtocol = vmRouteProtocol
        
    }
    
    func getContent(id: Int) -> Observable<ApiResponse<ContentResponse>> {
        return vmRouteProtocol!.getContent(url: RemoteApiConstants.Endpoints.getContent(id).stringValue, id: id)
    }
   
   
}
