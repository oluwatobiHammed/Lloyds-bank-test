//
//  IRoomRepo.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation

import Foundation
import RxSwift


 protocol IContentRepo {
    func getContent(id: Int) -> Observable<ApiResponse<ContentResponse>>
}
