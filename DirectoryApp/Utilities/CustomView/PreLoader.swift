//
//  PreLoader.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 09/07/2021.
//

import Foundation
import Lottie
import UIKit
protocol PreLoader {
    func showLoading()
    func hideLoading()
}

class DefaultPreLoader: PreLoader {
    let loaderAnimationView = AnimationView(name: "19195-loading-animation-circle-2")
    let view: UIView
    
    init(on view: UIView) {
        self.view = view
    }
    
    func showLoading() {
        self.view.addSubview(loaderAnimationView)
        loaderAnimationView.loopMode = .loop
        loaderAnimationView.play()
        addConstraints(newView: loaderAnimationView)
    }
    
    func addConstraints(newView: AnimationView) {
        newView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: newView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: newView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: newView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: newView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0))
    }
    
    func hideLoading() {
        UIView.animate(withDuration: 0.3, animations: {
              DispatchQueue.main.async {
            self.loaderAnimationView.alpha = 0
            }
        }) { (_) in
              DispatchQueue.main.async {
            self.loaderAnimationView.removeFromSuperview()
            }
        }
    }
}

