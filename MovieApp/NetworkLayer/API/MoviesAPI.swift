//
//  MoviesAPI.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import Foundation
import Moya

enum MoviesAPI {
    case getMovies
    case getSliderData
    case getDetail(id: String)
}

extension MoviesAPI: MTargetType {
    var path: String {
        switch self {
        case .getMovies:
            return generateEndPoint(lastPath: "/movie/upcoming")
        case .getSliderData:
            return generateEndPoint(lastPath: "/movie/now_playing")
        case .getDetail(let param):
            return generateEndPoint(lastPath: "/movie/\(param)")
        }
    }
    
    var method: MoyaMethod {
        switch self {
        case .getMovies:
            return .get
        case .getSliderData:
            return .get
        case .getDetail:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getMovies:
            let param = APIRequestModel(api_key: AppSettings.shared.apiKey)
            let encoding = URLEncoding(destination: .queryString, arrayEncoding: .noBrackets)
            return .requestParameters(parameters: param.dictionary()!, encoding: encoding)
        case .getSliderData:
            let param = APIRequestModel(api_key: AppSettings.shared.apiKey)
            let encoding = URLEncoding(destination: .queryString, arrayEncoding: .noBrackets)
            return .requestParameters(parameters: param.dictionary()!, encoding: encoding)
        case .getDetail:
            let param = APIRequestModel(api_key: AppSettings.shared.apiKey)
            let encoding = URLEncoding(destination: .queryString, arrayEncoding: .noBrackets)
            return .requestParameters(parameters: param.dictionary()!, encoding: encoding)
        }
    }
}

struct APIRequestModel: Codable, DictionaryEncodable {
    let api_key: String
}
