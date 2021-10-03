//
//  VMRouterProtocol.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift

protocol VMRouteProtocol {
    
    func getContent(url: String, id: Int) -> Observable<ApiResponse<ContentResponse>>
    func getContentList(url: String) -> Observable<ApiResponse<ContentListResponse>>
    
}
