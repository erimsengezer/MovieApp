//
//  MoviesNetworkManagerProtocol.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import Moya

protocol MoviesNetworkManagerProtocol {
    func getMovies(completion: @escaping (Result<MoviesAPIResponseModel, Error>) -> ())
    func getSliderData(completion: @escaping (Result<MoviesAPIResponseModel, Error>) -> ())
    func getMovieDetail(id: String, completion: @escaping (Result<MovieDetailAPIResponseModel, Error>) -> ())
}

class MoviesNetworkManager: BaseManager<MoviesAPI, MoyaProvider<MoviesAPI>>, MoviesNetworkManagerProtocol {
    
    override init(getMoviesProvider: MoyaProvider<MoviesAPI>) {
        super.init(getMoviesProvider: getMoviesProvider)
    }

    func getMovies(completion: @escaping (Result<MoviesAPIResponseModel, Error>) -> ()) {
        request(target: .getMovies, completion: completion)
    }
    
    func getSliderData(completion: @escaping (Result<MoviesAPIResponseModel, Error>) -> ()) {
        request(target: .getSliderData, completion: completion)
    }
    
    func getMovieDetail(id: String, completion: @escaping (Result<MovieDetailAPIResponseModel, Error>) -> ()) {
        request(target: .getDetail(id: id), completion: completion)
    }
}
