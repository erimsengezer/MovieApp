//
//  MainPresenter.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import Foundation

protocol MainPresenterProtocol {
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorProtocol { get }
    var coordinator: MainViewCoordinatorProtocol { get }
    
    var sliderViewModel: SliderDataViewModel? { get }
    var moviesViewModel: MoviesViewModel? { get }
    
    func viewDidLoad()
    func viewWillAppear()
}

class MainPresenter: MainPresenterProtocol {
    
    // MARK: - Public Properties
    let interactor: MainInteractorProtocol
    let coordinator: MainViewCoordinatorProtocol
    weak var view: MainViewProtocol?
    
    var sliderViewModel: SliderDataViewModel?
    var moviesViewModel: MoviesViewModel?
    
    // MARK: - Initializer
    init(interactor: MainInteractorProtocol, coordinatorProtocol: MainViewCoordinatorProtocol) {
        self.interactor = interactor
        self.coordinator = coordinatorProtocol
    }
    
    func viewDidLoad() {
        view?.configureMovieListCollectionView()
        view?.configureCollectionView()
        
        interactor.getSliderData()
        interactor.getMovies()
    }
    
    func viewWillAppear() {}
}


extension MainPresenter: MainInteractorOutputProtocol {
    func sliderDataSuccess(viewModel: SliderDataViewModel) {
        view?.refreshSlider(with: viewModel)
        self.sliderViewModel = viewModel
    }
    
    func sliderDataFailure(error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
    func moviesSuccess(viewModel: MoviesViewModel) {
        view?.refresh(with: viewModel)
        self.moviesViewModel = viewModel
    }
    
    func moviesFailure(error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}

