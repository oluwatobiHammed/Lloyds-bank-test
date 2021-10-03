//
//  MockRoomViewModel.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 08/08/2021.
//


import XCTest
import RxSwift
@testable import DirectoryApp

class MockRoomViewModel: BaseViewModel, IContentViewModel {
    
    var isGetPeopleMethodCalled: Bool = false
    var contentResponses: PublishSubject<ContentsViewModel>  = PublishSubject()
    
    
    let contentRepo: IContentRepo?
    required init(contentRepo: IContentRepo) {
        self.contentRepo = contentRepo
    }
    
   
    func getContent(id: Int) {
        isGetPeopleMethodCalled = true
        contentRepo?.getContent(id: id).subscribe({ res in
            if let peopleRes = res.element?.data?.item {
                self.contentResponses.onNext( ContentsViewModel(content: peopleRes))
            }
        }).dispose()
    }

  

}

