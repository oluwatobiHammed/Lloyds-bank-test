//
//  PeopleInjections.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import Swinject
import SwinjectStoryboard

class ContentListInjections {
    static func setup(container: Container) {
        container.register(BaseNetWorkProtocol.self) { _ in
            BaseNetWorkServices() }
        container.register(VMRouteProtocol.self) { res in
            VMRoute(baseNetwork: res.resolve(BaseNetWorkProtocol.self)!) }
        container.register(IContentListRepo.self) { res in
            ContentListRepoImpl(vmRouteProtocol: res.resolve(VMRouteProtocol.self)!)
        }
        container.register(ContentRepoImpl.self) { res in
            ContentRepoImpl(vmRouteProtocol: res.resolve(VMRouteProtocol.self)!)
        }
        container.register(IContentListViewModel.self) { res in
            ContentListViewModel(contentRepo: res.resolve(IContentListRepo.self)!)
        }
        container.register(ContentListViewModel.self) { res in
            ContentListViewModel(contentRepo: res.resolve(IContentListRepo.self)!)
        }
        
        
        // MARK: - Storyboard
        container.storyboardInitCompleted(ContentListViewController.self) { (res, cntrl) in
            cntrl.contentViewModel = res.resolve(IContentListViewModel.self)
        }
        
        container.storyboardInitCompleted(ContentListViewController.self) { (res, cntrl) in
            cntrl.contentViewModel = res.resolve(ContentListViewModel.self)
        }
        
      
    }
}
