//
//  ApiResponse.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation

 struct ApiResponse<T: Codable>: Codable {
     var data: T? = nil
     var error: ApiError? = nil
}
