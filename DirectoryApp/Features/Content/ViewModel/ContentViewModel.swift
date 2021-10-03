//
//  ViewModel.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import RxSwift
import RxCocoa

class ContentViewModel: BaseViewModel, IContentViewModel {
   
    var contentResponses: PublishSubject<ContentsViewModel>  = PublishSubject()
    private let contentRepo: IContentRepo
    
    required init(contentRepo: IContentRepo) {
        self.contentRepo = contentRepo
    }
    
    func getContent(id: Int) {
        self.isLoading.onNext(true)
        contentRepo.getContent(id: id).subscribe ( onNext: { [weak self] res in
            self?.isLoading.onNext(false)
            if let contentRes = res.data?.item {
                self?.contentResponses.onNext( ContentsViewModel(content: contentRes))
            }
            else if let apiErr = res.error {
            self?.apiError.onNext(apiErr)
        }
        },
        onError: { [weak self] error in
            self?.isLoading.onNext(false)
            self?.throwableError.onNext(error)
        }

    ).disposed(by: disposeBag)
    
    }
    
}
