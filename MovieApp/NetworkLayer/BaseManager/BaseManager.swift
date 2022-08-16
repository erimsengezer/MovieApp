//
//  BaseManager.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import Foundation
import Moya

class BaseManager<Target: TargetType, Provider: MoyaProvider<Target>> {
    private var getMoviesProvider: Provider
    
    init(getMoviesProvider: Provider) {
        self.getMoviesProvider = getMoviesProvider
    }
    
    func request<T: Decodable>(target: Target, completion: @escaping (Result<T, Error>) -> ()) {
        getMoviesProvider.request(target) { result in
            
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
