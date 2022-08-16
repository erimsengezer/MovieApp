//
//  MovieListCollectionViewDelegate.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import UIKit

protocol MovieListCollectionViewDelegateOutput: AnyObject {
    func didSelectItem(indexPath: IndexPath)
}

class MovieListCollectionViewDelegate: NSObject {
    weak var output: MovieListCollectionViewDelegateOutput?
}

extension MovieListCollectionViewDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output?.didSelectItem(indexPath: indexPath)
    }
}

extension MovieListCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 130)
    }
}
