//
//  UILabelExtension.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 09/07/2021.
//

import Foundation
import UIKit

extension UILabel {
    
    func useCaptionFont(by: CGFloat) {
        self.font = ThemeManager.captionFont(sizeBy: by)
    }
    
    func useDefaultFont(by: CGFloat=0) {
        self.font = ThemeManager.defaultFont(sizeBy: by)
    }
    
    func usingFont(of: FontStyle, sizeBy: CGFloat = 0) {
        self.font = of.getFont(sizeBy: sizeBy)
    }
}
