//
//  DetailBuilder.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//  Copyright (c) 2022 All rights reserved.[EC-2021]
// 

import UIKit
import Moya

enum DetailBuilder {
    
    static func generate(id: String, coordinatorProtocol: MainViewCoordinatorProtocol) -> UIViewController? {
        let provider = MoyaProvider<MoviesAPI>()
        let networkManager = MoviesNetworkManager(getMoviesProvider: provider)
        
        let service: DetailServiceProtocol = DetailService(networkManager: networkManager, id: id)
        let repository: DetailRepositoryProtocol = DetailRepository(service: service)
        var interactor: DetailInteractorProtocol = DetailInteractor(repository: repository)
        var presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter(interactor: interactor, coordinatorProtocol: coordinatorProtocol)
        let view: DetailViewProtocol = DetailViewController(presenter: presenter)
        
        presenter.view = view
        interactor.output = presenter
        
        return view as? UIViewController
    }
}
