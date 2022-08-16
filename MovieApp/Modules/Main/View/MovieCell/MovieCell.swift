//
//  MovieCell.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {

    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(itemViewModel: MovieViewModel?) {
        guard let viewModel = itemViewModel else { return }
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        dateLabel.text = viewModel.date
        
        let imageUrlString = "\(AppSettings.shared.imageBaseUrl)\(viewModel.image)"
        guard let imageURL = URL(string: imageUrlString) else { return }
        imageView.kf.setImage(with: imageURL)
    }
}
