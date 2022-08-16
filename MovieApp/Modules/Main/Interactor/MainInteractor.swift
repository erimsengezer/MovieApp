//
//  MainInteractor.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
// 

import Foundation

protocol MainInteractorProtocol {
    var repository: MainRepositoryProtocol { get }
    var output: MainInteractorOutputProtocol? { get set }
    
    func getMovies()
    func getSliderData()
}

protocol MainInteractorOutputProtocol: AnyObject {
    func sliderDataSuccess(viewModel: SliderDataViewModel)
    func sliderDataFailure(error: Error)
    
    func moviesSuccess(viewModel: MoviesViewModel)
    func moviesFailure(error: Error)
}

class MainInteractor: MainInteractorProtocol {
    
    // MARK: - Public Properties
    let repository: MainRepositoryProtocol
    weak var output: MainInteractorOutputProtocol?
    
    // MARK: - Initializer
    init(repository: MainRepositoryProtocol) {
        self.repository = repository
    }
    
    func getMovies() {
        repository.getMovies { model in
            let viewModel: MoviesViewModel = MoviesViewModel(response: model)
            self.output?.moviesSuccess(viewModel: viewModel)
        } failure: { error in
            self.output?.moviesFailure(error: error)
        }
    }
    
    func getSliderData() {
        repository.getSliderData { model in
            let viewModel = SliderDataViewModel(response: model)
            self.output?.sliderDataSuccess(viewModel: viewModel)
        } failure: { error in
            self.output?.sliderDataFailure(error: error)
        }

    }
}
