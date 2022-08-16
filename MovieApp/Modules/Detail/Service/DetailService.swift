//
//  DetailService.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
// 

import Foundation

protocol DetailServiceProtocol: AnyObject {
    func getMovieDetail(success: @escaping (MovieDetailAPIResponseModel) -> Void, failure: @escaping (Error) -> Void)
}

class DetailService: DetailServiceProtocol {
    let networkManager: MoviesNetworkManager
    let id: String
    
    init(networkManager: MoviesNetworkManager, id: String) {
        self.networkManager = networkManager
        self.id = id
    }
    
    func getMovieDetail(success: @escaping (MovieDetailAPIResponseModel) -> Void, failure: @escaping (Error) -> Void) {
        networkManager.getMovieDetail(id: self.id) { result in
            switch result {
            case .success(let data):
                success(data)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
