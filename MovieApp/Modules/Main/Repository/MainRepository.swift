//
//  MainRepository.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
// 

import Foundation

protocol MainRepositoryProtocol {
    func getMovies(success: @escaping (MoviesAPIResponseModel) -> Void, failure: @escaping (Error) -> Void )
    func getSliderData(success: @escaping (MoviesAPIResponseModel) -> Void, failure: @escaping (Error) -> Void)
}

class MainRepository: MainRepositoryProtocol {
    // MARK: - Properties
    let service: MainServiceProtocol
    
    // MARK: - Initializer
    init(service: MainServiceProtocol) {
        self.service = service
    }
    
    func getMovies(success: @escaping (MoviesAPIResponseModel) -> Void, failure: @escaping (Error) -> Void ) {
        service.getMovies { model in
            success(model)
        } failure: { error in
            failure(error)
        }
    }
    
    func getSliderData(success: @escaping (MoviesAPIResponseModel) -> Void, failure: @escaping (Error) -> Void) {
        service.getSliderData { model in
            success(model)
        } failure: { error in
            failure(error)
        }
    }
}
