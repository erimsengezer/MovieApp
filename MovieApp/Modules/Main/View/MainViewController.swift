//
//  MainViewController.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import UIKit
import Moya

protocol MainViewProtocol: AnyObject {
    var presenter: MainPresenterProtocol { get }
    
    func configureCollectionView()
    func configureMovieListCollectionView()
    func refresh(with viewModel: MoviesViewModel)
    func refreshSlider(with viewModel: SliderDataViewModel)
}

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var movieListCollectionView: UICollectionView!
    
    // MARK: - Public Properties
    let presenter: MainPresenterProtocol
    
    // MARK: - Private Properties
    
    private var movieListCollectionViewDelegate: MovieListCollectionViewDelegate?
    private var movieListCollectionViewDataSource: MovieListCollectionViewDataSource?
    
    private let refreshControl = UIRefreshControl()
    
    // MARK: Initializers
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: .main)
    }
    
    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.sliderViewModel?.sliderCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as? SliderCollectionViewCell else { return UICollectionViewCell() }
        let itemViewModel = self.presenter.sliderViewModel?.getItemViewModel(indexPath: indexPath)
        cell.configureView(viewModel: itemViewModel)
        pageControl.currentPage = indexPath.row
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let itemViewModel = presenter.sliderViewModel?.getItemViewModel(indexPath: indexPath) else { return }
        UIApplication.shared.appCoordinator?.detailScreen(id: itemViewModel.id)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPosition = scrollView.contentOffset.x / view.frame.width
        pageControl.currentPage = Int(scrollPosition)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension MainViewController: MainViewProtocol {
    func configureCollectionView() {
        self.navigationController?.navigationBar.isHidden = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "SliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SliderCollectionViewCell")
    }
    
    func configureMovieListCollectionView() {
        self.movieListCollectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        
        self.movieListCollectionViewDelegate = MovieListCollectionViewDelegate()
        self.movieListCollectionViewDelegate?.output = self
        self.movieListCollectionViewDataSource = MovieListCollectionViewDataSource()
        
        movieListCollectionView.delegate = movieListCollectionViewDelegate
        movieListCollectionView.dataSource = movieListCollectionViewDataSource
    }
    
    private func stopRefresher() {
        self.collectionView.refreshControl?.endRefreshing()
     }
    
    func refresh(with viewModel: MoviesViewModel) {
        self.movieListCollectionViewDataSource?.update(viewModel: viewModel)
        self.movieListCollectionView.reloadData()
    }
    
    func refreshSlider(with viewModel: SliderDataViewModel) {
        pageControl.numberOfPages = viewModel.sliderCount
        pageControl.currentPage = 0
        collectionView.reloadData()
    }
}

extension MainViewController: MovieListCollectionViewDelegateOutput {
    func didSelectItem(indexPath: IndexPath) {
        guard let itemViewModel = presenter.moviesViewModel?.getItemViewModel(indexPath: indexPath) else { return }
        UIApplication.shared.appCoordinator?.detailScreen(id: itemViewModel.id)
    }
}



