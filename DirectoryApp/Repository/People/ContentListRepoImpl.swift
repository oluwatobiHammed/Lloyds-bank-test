//
//  PeopleRepoImpl.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift


 struct ContentListRepoImpl: IContentListRepo {
 
    private var RouteProtocol: VMRouteProtocol
     init(vmRouteProtocol: VMRouteProtocol) {
        self.RouteProtocol = vmRouteProtocol
    }
    
    func getContentList() -> Observable<ApiResponse<ContentListResponse>> {
        return RouteProtocol.getContentList(url: RemoteApiConstants.Endpoints.getContentList.stringValue)
    }
   
}
