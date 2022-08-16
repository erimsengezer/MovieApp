//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import Foundation

struct MoviesViewModel {
    let response: MoviesAPIResponseModel
    
    init(response: MoviesAPIResponseModel) {
        self.response = response
    }
    
    var numberOfItems: Int {
        return response.results?.count ?? 0
    }
    
    func getItemViewModel(indexPath: IndexPath) -> MovieViewModel? {
        guard let item = self.response.results?[indexPath.row] else { return nil}
        return MovieViewModel(movie: item)
    }
}
