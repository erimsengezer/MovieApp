//
//  DetailRepository.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
// 

import Foundation

protocol DetailRepositoryProtocol {
    func getMovieDetail(success: @escaping (MovieDetailAPIResponseModel) -> Void, failure: @escaping (Error) -> Void)
}

class DetailRepository: DetailRepositoryProtocol {
    // MARK: - Properties
    let service: DetailServiceProtocol
    
    // MARK: - Initializer
    init(service: DetailServiceProtocol) {
        self.service = service
    }
    
    func getMovieDetail(success: @escaping (MovieDetailAPIResponseModel) -> Void, failure: @escaping (Error) -> Void) {
        service.getMovieDetail { model in
            success(model)
        } failure: { error in
            failure(error)
        }

    }
}
