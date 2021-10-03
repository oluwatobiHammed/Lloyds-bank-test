//
//  PeopleViewModelImpl.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//
import RxSwift
import RxCocoa


class ContentListViewModel: BaseViewModel, IContentListViewModel {
    
    var contentResponses: PublishSubject<[ItemsViewModel]>  = PublishSubject()
    let contentRepo: IContentListRepo
    
    
    required init(contentRepo: IContentListRepo) {
        self.contentRepo = contentRepo
    }
    
    func getContentList() {
        self.isLoading.onNext(true)
        contentRepo.getContentList().subscribe ( onNext: { [weak self]  in
            self?.isLoading.onNext(false)
            if let contentRes = $0.data?.items {
                self?.contentResponses.onNext(contentRes.map({return ItemsViewModel(items: $0)
                }))
               
            }
            else if let apiErr = $0.error {
                self?.apiError.onNext(apiErr)
                print("apiErr",apiErr)
                
            }
        },
        onError: { [weak self] error in
            self?.isLoading.onNext(false)
            self?.throwableError.onNext(error)
            print("error",error)
        }).disposed(by: disposeBag)
        
    }
}
