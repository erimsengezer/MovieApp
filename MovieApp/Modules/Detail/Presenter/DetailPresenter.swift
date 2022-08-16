//
//  DetailPresenter.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
//
import Foundation

protocol DetailPresenterProtocol {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorProtocol { get }
    var coordinator: MainViewCoordinatorProtocol { get }
    
    func viewDidLoad()
    func viewWillAppear()
}

class DetailPresenter: DetailPresenterProtocol {
    
    // MARK: - Public Properties
    let interactor: DetailInteractorProtocol
    let coordinator: MainViewCoordinatorProtocol
    weak var view: DetailViewProtocol?
    
    // MARK: - Initializer
    init(interactor: DetailInteractorProtocol, coordinatorProtocol: MainViewCoordinatorProtocol) {
        self.interactor = interactor
        self.coordinator = coordinatorProtocol
    }
    
    func viewDidLoad() {
        interactor.getMovieDetail()
    }
    
    func viewWillAppear() {
        view?.configureNavigationBar()
    }
}


extension DetailPresenter: DetailInteractorOutputProtocol {
    func movieDetailSuccess(model: MovieDetailAPIResponseModel) {
        view?.configureView(model: model)
    }
    
    func movieDetailFailure(error: Error) {
        view?.presentAlert(message: error.localizedDescription)
    }
}

