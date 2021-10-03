//
//  UIImage+extension.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 11/07/2021.
//

import UIKit
import Kingfisher

extension UIImageView {
     func setImage(imageUrl: String) {
        let processor = RoundCornerImageProcessor(cornerRadius: 50)
        self.kf.indicatorType = .activity
        self.kf.setImage(
           
            with: URL(string: imageUrl),
            placeholder: UIImage(named: "profile_image_icon"),
            options: [.transition(.fade(0.2)), .processor(processor)]
        )
    }
}
