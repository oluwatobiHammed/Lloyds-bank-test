//
//  PeopleTableViewCellViewModel.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 20/07/2021.
//

import Foundation


struct ItemsViewModel {
    var id: Int
    var title: String,
        subtitle: String,
        date: String
   

    init(items: Items) {
        self.id = items.id!
        self.title = "Title: " + items.title!
        self.subtitle = "Subtitle: " + items.subtitle!
        self.date =  items.date!
    }
}
