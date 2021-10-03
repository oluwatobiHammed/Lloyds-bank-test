//
//  BaseViewController.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 06/07/2021.
//

import UIKit
import RxSwift


class BaseViewController: UIViewController, ViewControllerPresentRequestDataReceiver,ViewControllerPresentedDidDisappear {
    var presentRequestData: Any?
    static var displayingViewController: UIViewController?
    var viewControllerWillDisappearData: Any?
    var disposeBag: DisposeBag? = DisposeBag()
    var didRemoveViewControllerSubject: PublishSubject<Any?>?
    var viewControllerPresenterDisposable: Disposable?
    var contactDisplayRequesterDisposable: Disposable?
    fileprivate var preloader: PreLoader!
    fileprivate var alert: CustomAlert?
    deinit {
        print("Disposing \(self)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setObservers()
        self.preloader = DefaultPreLoader(on: self.view)
        self.alert = CustomAlert(on: self.view)
    }
    
    func getViewModel() -> BaseViewModel {
        preconditionFailure("The subclass BaseViewController must provide a subclass of BaseViewModel")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getViewModel().viewWillAppear()
        BaseViewController.displayingViewController = self
        self.viewControllerPresenterDisposable?.dispose()
        self.viewControllerPresenterDisposable = ViewControllerPresenter.shared.presentViewControllerObserver.subscribe(onNext: { (request) in
            self.displayViewController(fromRequest: request)
        })
        
        if let dispose = disposeBag {
            self.contactDisplayRequesterDisposable?.disposed(by: dispose)
            self.viewControllerPresenterDisposable?.disposed(by: dispose)
        }
        
        DynamicViewControllerPathResolver.shared.presentNextViewController()
      
    }

    override func viewWillDisappear(_ animated: Bool) {
        getViewModel().viewWillDisappear()
        BaseViewController.displayingViewController = nil
        self.viewControllerPresenterDisposable?.dispose()
         self.contactDisplayRequesterDisposable?.dispose()
        if self.isMovingFromParent {
            self.onRemovingFromParent()
            self.disposeBag = nil
        }
        //shareDisposable?.dispose()
    }
    
    private func setObservers() {
        observeLoadingState()
        observeApiErrorState()
        observeThrowableErrorState()
        observeAlerts()
    }
    
    private func observeAlerts() {
        if let dispose = disposeBag {
        getViewModel().alertValue.asObservable().bind { [weak self] value in
            self?.showAlert(message: value.message, type: value.type)
        }.disposed(by: dispose)
        }
    }
    
    
    
    private func observeLoadingState() {
        if let dispose = disposeBag {
        getViewModel().isLoading.asObservable().bind { [weak self] value in
            if value {
                self?.showLoading()
            } else {
                self?.hideLoading()
            }
        }.disposed(by: dispose)
        }
    }
    
    private func observeApiErrorState() {
        if let dispose = disposeBag {
        getViewModel().apiError.asObservable().bind{ [weak self] apiError in
            self?.showAlert(message: apiError.errors.first?.message ?? "An error occurred. Please try again!", type: .error)
        }.disposed(by: dispose)
        }
    }
    
    private func observeThrowableErrorState() {
        if let dispose = disposeBag {
        getViewModel().throwableError.asObserver().bind { [weak self] error in
            self?.showAlert(message: error.localizedDescription, type: .error)
        }.disposed(by: dispose)
        }
    }
    
    private func showLoading() {
         DispatchQueue.main.async {
        self.preloader.showLoading()
        }
    }
    
    private func hideLoading() {
        DispatchQueue.main.async {
              self.preloader.hideLoading()
        }
      
    }
    
     func showAlert(message: String, type: AlertType) {
        self.alert?.showAlert(text: message, type: type)
    }
    
   
    
    override func viewDidAppear(_ animated: Bool) { getViewModel().viewDidAppear() }
    
    override func viewDidDisappear(_ animated: Bool) { getViewModel().viewDidDisappear() }
    

}
