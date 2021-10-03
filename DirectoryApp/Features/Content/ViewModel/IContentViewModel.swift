//
//  IRoomViewModel.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift

protocol IContentViewModel: AnyObject {
    var contentResponses: PublishSubject<ContentsViewModel> { get }
    init(contentRepo: IContentRepo)
    func getContent(id: Int)
   
}
