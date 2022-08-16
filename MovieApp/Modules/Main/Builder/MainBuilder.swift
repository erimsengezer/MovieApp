//
//  MainBuilder.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
// 

import UIKit
import Moya

enum MainBuilder {
    
    static func generate(coordinatorProtocol: MainViewCoordinatorProtocol) -> UIViewController? {
        let provider = MoyaProvider<MoviesAPI>()
        let networkManager = MoviesNetworkManager(getMoviesProvider: provider)
        
        
        let service: MainServiceProtocol = MainService(networkManager: networkManager)
        let repository: MainRepositoryProtocol = MainRepository(service: service)
        var interactor: MainInteractorProtocol = MainInteractor(repository: repository)
        var presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter(interactor: interactor, coordinatorProtocol: coordinatorProtocol)
        let view: MainViewProtocol = MainViewController(presenter: presenter)
        
        presenter.view = view
        interactor.output = presenter
        
        return view as? UIViewController
    }
}
