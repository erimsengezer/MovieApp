//
//  SliderDataItemViewModel.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import Foundation

struct SliderDataItemViewModel {
    private let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var id: String {
        return String(movie.id)
    }
    
    var title: String {
        return movie.title
    }
    
    var description: String {
        return movie.overview
    }
    
    var image: String {
        return movie.backdropPath
    }
}
