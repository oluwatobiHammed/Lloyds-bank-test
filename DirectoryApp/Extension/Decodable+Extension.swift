//
//  Decodable+Extention.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation

extension Decodable {
    ///Maps JSON String to actual Decodable Object
    ///throws an exception if mapping fails
    static func mapTo(jsonString: String) throws -> Self? {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        return try decoder.decode(Self.self, from: Data(jsonString.utf8))
    }
}
