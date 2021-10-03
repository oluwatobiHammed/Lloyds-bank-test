//
//  VMRoomResponse.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 07/07/2021.
//

import Foundation


struct ContentResponse: Codable {
    let item: Item?
}

struct Item: Codable {
    let id: Int?
    let title, subtitle, body, date: String?
}

