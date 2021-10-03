//
//  IPeopleRepo.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift


 protocol IContentListRepo {
    func getContentList() -> Observable<ApiResponse<ContentListResponse>>
}
