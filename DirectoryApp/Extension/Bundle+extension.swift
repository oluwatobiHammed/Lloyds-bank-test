//
//  Bundle+extension.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 12/07/2021.
//
import Foundation
import RxSwift


enum FileReadError: Error {
   case fileNotFound, unreadable, encodingFailed
 }
extension Bundle {
   
    func decode(from file: String) ->  Data {
           
           guard let url = self.url(forResource: file, withExtension: nil) else {
                    fatalError("Failed to locate \(file) in bundle.")
                }
                
                guard let data = try? Data(contentsOf: url) else {
                    fatalError("Failed to load \(file) from bundle.")
                }
       return data
        
        
       }
    
    func decode<T>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> Observable<T> where T : Codable {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        

        do {
            let responseString = String(data: data, encoding: .utf8)

            let jsonString = responseString!.localizedCaseInsensitiveContains("errors") ?
                self.getJsonString(withKey: "error", forValue: responseString!) :
                self.getJsonString(withKey: "data", forValue: responseString!)
            //map the result of `jsonString` above to the `responseType`
            return Observable.just(try type.mapTo(jsonString: jsonString)!)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
    
    fileprivate func getJsonString(withKey: String, forValue: String)  -> String {
        let jsonStringDictionary = "{\"\(withKey)\": \(forValue)}"
        return jsonStringDictionary
    }
}
