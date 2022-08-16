//
//  SliderCollectionViewCell.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import UIKit
import Kingfisher

class SliderCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureView(viewModel: SliderDataItemViewModel?) {
        guard let viewModel = viewModel else { return }

        self.titleLabel.text = viewModel.title
        self.subtitleLabel.text = viewModel.description
        
        let imageUrlString = "\(AppSettings.shared.imageBaseUrl)\(viewModel.image)"
        guard let imageURL = URL(string: imageUrlString) else { return }
        imageView.kf.setImage(with: imageURL)
    }
}
