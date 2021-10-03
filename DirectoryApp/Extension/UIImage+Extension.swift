//
//  UIImage+Extension.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 20/07/2021.
//

import UIKit

extension UIImage {
    func resizedImage(with size: CGSize) -> UIImage? {
        //Create Graphics context
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        //Draw Image in graphics context
        draw(in:  CGRect(origin: .zero, size: size))
        
        //Create Image from current graphics context
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // Clean up graphics context
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
}
