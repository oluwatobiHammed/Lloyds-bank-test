//
//  ViewControllerPresenter.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 06/07/2021.
//

import UIKit
import RxSwift

class ViewControllerPresenter {
    fileprivate var requestSubject = PublishSubject<ViewControllerPresentRequest>()
    
    static let shared = ViewControllerPresenter()
    
    var presentViewControllerObserver: Observable<ViewControllerPresentRequest> {
        return requestSubject.asObserver()
    }
    
    fileprivate init() {}
    
    func presentViewController(request: ViewControllerPresentRequest) {
        if let presenter = request.presenter {
            presenter.displayViewController(fromRequest: request)
        }
        else {
            self.requestSubject.onNext(request)
        }
    }
}
