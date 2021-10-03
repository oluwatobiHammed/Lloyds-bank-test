//
//  RoomInjections.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import Swinject
import SwinjectStoryboard

class ContentInjections {
    static func setup(container: Container) {
        container.register(BaseNetWorkProtocol.self) { res in
            BaseNetWorkServices() }
        container.register(VMRouteProtocol.self) { res in
            VMRoute(baseNetwork: res.resolve(BaseNetWorkProtocol.self)!)
        }
        container.register(IContentRepo.self) { res in
            ContentRepoImpl(vmRouteProtocol: res.resolve(VMRouteProtocol.self)!)
        }
        container.register(IContentViewModel.self) { res in
            ContentViewModel(contentRepo: res.resolve(IContentRepo.self)!)
        }
        container.register(ContentViewModel.self) { res in
            ContentViewModel(contentRepo: res.resolve(IContentRepo.self)!)
        }
        
        
        // MARK: - Storyboard
        container.storyboardInitCompleted(ContentViewController.self) { (res, cntrl) in
            cntrl.contentViewModel = res.resolve(IContentViewModel.self)
        }
        
        container.storyboardInitCompleted(ContentViewController.self) { (res, cntrl) in
            cntrl.contentViewModel = res.resolve(ContentViewModel.self)
        }
        
      
    }

}
