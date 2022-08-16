//
//  SliderDataViewModel.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import Foundation

struct SliderDataViewModel {
    private let response: MoviesAPIResponseModel
    
    init(response: MoviesAPIResponseModel) {
        self.response = response
    }
    
    var sliderCount: Int {
        return response.results?.count ?? 0
    }
    
    func getItemViewModel(indexPath: IndexPath) -> SliderDataItemViewModel? {
        guard let item = self.response.results?[indexPath.row] else { return nil}
        return SliderDataItemViewModel(movie: item)
    }
}
