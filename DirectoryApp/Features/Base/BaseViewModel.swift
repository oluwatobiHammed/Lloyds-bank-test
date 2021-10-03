//
//  BaseViewModel.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift


class BaseViewModel {
    
    let disposeBag = DisposeBag()
    let isLoading: PublishSubject<Bool> = PublishSubject()
    let alertValue: PublishSubject<AlertValue> = PublishSubject()
    let apiError: PublishSubject<ApiError> = PublishSubject()
    let throwableError: PublishSubject<Error> = PublishSubject()

    func viewDidLoad() { }

    func viewWillAppear() { }

    func viewDidAppear() { }

    func viewWillDisappear() { }

    func viewDidDisappear() { }
    
}
