//
//  IPeopleViewModel.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift

protocol IContentListViewModel: AnyObject {
    var contentResponses: PublishSubject<[ItemsViewModel]> { get }
    func getContentList()
   
}
