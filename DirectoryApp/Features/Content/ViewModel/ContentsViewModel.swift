//
//  RoomCellViewModel.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 20/07/2021.
//

import Foundation
import UIKit

struct ContentsViewModel {
    let title, subtitle, body, date: String
    
    init(content: Item) {
        self.title = "Title: \(content.title!)"
        self.subtitle = "Subtitle: \(content.subtitle!)"
        self.body =  "Body: \(content.body!)"
        self.date = "Date: \(content.date!)"
    }
}
