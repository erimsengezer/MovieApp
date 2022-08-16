//
//  DetailViewController.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
//

import UIKit
import Kingfisher

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol { get }
    
    func configureView(model: MovieDetailAPIResponseModel)
    func presentAlert(message: String)
    func configureNavigationBar()
}

class DetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    
    
    // MARK: - Public Properties
    let presenter: DetailPresenterProtocol
    
    // MARK: - Private Properties
    
    // MARK: Initializers
    init(presenter: DetailPresenterProtocol) {
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
}

extension DetailViewController: DetailViewProtocol {
    func configureView(model: MovieDetailAPIResponseModel) {
        titleLabel.text = model.title ?? ""
        self.title = model.title ?? ""
        textView.text = model.overview
        
        guard let path = model.backdropPath else { return }
        let imageUrlString = "\(AppSettings.shared.imageBaseUrl)\(path)"
        guard let imageURL = URL(string: imageUrlString) else { return }
        imageView.kf.setImage(with: imageURL)
    }
    
    func presentAlert(message: String) {
        self.showAlert(message: message, title: "Error!")
    }
    
    func configureNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
    }
}
