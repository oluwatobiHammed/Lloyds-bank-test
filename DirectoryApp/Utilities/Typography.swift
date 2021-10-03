//
//  Typography.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 09/07/2021.
//

import Foundation
import UIKit

public enum FontStyle: String {
    case Default = "Montserrat"
    case Bold = "Montserrat-Bold"
    case SemiBold = "Montserrat-SemiBold"
    case ExtraBold = "Montserrat-ExtraBold"
    case Black = "Montserrat-Black"
    case Medium = "Montserrat-Medium"
    case Light = "Montserrat-Light"
    case Icon = "iconset"
    
    var size: CGFloat {
        switch self {
        case .Default:
            return 13
        case .Bold:
            return 13
        case .Icon:
            return 20
        default:
            return 13
        }
    }
    
    func step(by: CGFloat = 1)-> CGFloat {
        return self.size + (2.0 * by)
    }
    func getFont(sizeBy: CGFloat = 0)-> UIFont {
        return UIFont(name: self.rawValue, size: self.step(by: sizeBy))!
    }
    
    static func fontFromStyle(name: String)-> FontStyle? {
        switch name {
        case "Default":
            return FontStyle.Default
        case "Bold":
            return FontStyle.Bold
        case "SemiBold":
            return FontStyle.SemiBold
        case "ExtraBold":
            return FontStyle.ExtraBold
        case "Black":
            return FontStyle.Black
        case "Medium":
            return FontStyle.Medium
        case "Light":
            return FontStyle.Light
        case "Icon":
            return FontStyle.Icon
        default:
            return nil
        }
    }
}
