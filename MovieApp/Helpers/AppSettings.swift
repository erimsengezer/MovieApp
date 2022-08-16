//
//  AppSettings.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import Foundation

class AppSettings {
    static let shared: AppSettings = AppSettings()
    
    var apiKey: String {
        return "f24b85d557b4b7ef295b4f0a409c6539"
    }
    
    var baseUrl: String {
        return "https://api.themoviedb.org/3"
    }
    
    var imageBaseUrl: String {
        return "https://image.tmdb.org/t/p/original"
    }
}
