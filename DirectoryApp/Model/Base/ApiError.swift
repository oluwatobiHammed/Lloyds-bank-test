//
//  ApiError.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

 struct ApiError: Codable {
     let errors: [ErrorMessage]
     let statusCode: CLong
}
