//
//  MovieListCollectionViewDataSource.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import UIKit

class MovieListCollectionViewDataSource: NSObject {
    
    var viewModel: MoviesViewModel?
    
    func update(viewModel: MoviesViewModel) {
        self.viewModel = viewModel
    }
}

extension MovieListCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell else { return UICollectionViewCell() }
        let itemViewModel = viewModel?.getItemViewModel(indexPath: indexPath)
        cell.configureCell(itemViewModel: itemViewModel)
        return cell
    }
}
