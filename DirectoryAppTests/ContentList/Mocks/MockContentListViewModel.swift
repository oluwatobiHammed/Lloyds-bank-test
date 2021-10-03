//
//  MockPeopleViewModel.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 06/08/2021.
//

import XCTest
import RxSwift
@testable import DirectoryApp

class MockContentListViewModel: BaseViewModel, IContentListViewModel {
    var contentResponses: PublishSubject<[ItemsViewModel]> = PublishSubject()
    var isGetPeopleMethodCalled: Bool = false
    var baseNetwork: BaseNetWorkProtocol!
    var route: VMRouteProtocol!
    var contentRepo: IContentListRepo!
   
    
    func getContentList() {
        baseNetwork = BaseNetWorkServices()
        route = VMRoute(baseNetwork: baseNetwork)
        contentRepo =  ContentListRepoImpl(vmRouteProtocol: route)
        self.isGetPeopleMethodCalled = true
        contentRepo?.getContentList().subscribe(onNext: { res in
            if (res.data?.items) != nil {
                
               // self.contentResponses.onNext(contentRes.map({return ItemsViewModel(items: $0)
                //}))
            }
            else if let apiErr = res.error {
                self.apiError.onNext(apiErr)
                
            }
        },
        
        onError: { [weak self] error in
            self?.isLoading.onNext(false)
            self?.throwableError.onNext(error)
        }).dispose()
        
    }
    

  

}
