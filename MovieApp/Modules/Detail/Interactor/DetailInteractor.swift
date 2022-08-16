//
//  DetailInteractor.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
// 

import Foundation

protocol DetailInteractorProtocol {
    var repository: DetailRepositoryProtocol { get }
    var output: DetailInteractorOutputProtocol? { get set }
    
    func getMovieDetail()
}

protocol DetailInteractorOutputProtocol: AnyObject {
    func movieDetailSuccess(model: MovieDetailAPIResponseModel)
    func movieDetailFailure(error: Error)
}

class DetailInteractor: DetailInteractorProtocol {
    
    // MARK: - Public Properties
    let repository: DetailRepositoryProtocol
    weak var output: DetailInteractorOutputProtocol?
    
    // MARK: - Initializer
    init(repository: DetailRepositoryProtocol) {
        self.repository = repository
    }
    
    func getMovieDetail() {
        repository.getMovieDetail { model in
            self.output?.movieDetailSuccess(model: model)
        } failure: { error in
            self.output?.movieDetailFailure(error: error)
        }

    }
}
