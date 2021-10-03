//
//  VMPeopleResponse.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 07/07/2021.
//

import Foundation


struct ContentListResponse: Codable {
    let items: [Items]?
}


struct Items: Codable {
    let id: Int?
    let title: String?
    let subtitle: String?
    let date: String?
}



