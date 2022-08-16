//
//  MainService.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
// 

import Foundation

protocol MainServiceProtocol: AnyObject {
    func getMovies(success: @escaping (MoviesAPIResponseModel) -> Void, failure: @escaping (Error) -> Void)
    func getSliderData(success: @escaping (MoviesAPIResponseModel) -> Void, failure: @escaping (Error) -> Void)
}

class MainService: MainServiceProtocol {
    let networkManager: MoviesNetworkManager
    
    init(networkManager: MoviesNetworkManager) {
        self.networkManager = networkManager
    }
    
    func getMovies(success: @escaping (MoviesAPIResponseModel) -> Void, failure: @escaping (Error) -> Void) {
        networkManager.getMovies { result in
            switch result {
            case .success(let data):
                success(data)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    func getSliderData(success: @escaping (MoviesAPIResponseModel) -> Void, failure: @escaping (Error) -> Void) {
        networkManager.getSliderData { result in
            switch result {
            case .success(let data):
                success(data)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
