//
//  Utils.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import Foundation

enum Utils {
    private static func jsonData(_ fileName: String) -> Data? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else { return nil }
        return try? Data(contentsOf: URL(fileURLWithPath: path) as URL, options: .alwaysMapped)
    }
    
    static func convertFrom<T: Codable>(fileName: String) -> T? {
        guard let data = Self.jsonData(fileName) else { return nil }
        
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        }
        catch {
            print("Decoding Error: \(error)")
            return nil
        }
    }
}
