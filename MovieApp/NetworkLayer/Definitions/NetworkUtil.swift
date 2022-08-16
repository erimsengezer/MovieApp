//
//  NetworkUtil.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import Foundation

enum APIEnvironment {
    case dev
    case production
}

struct NetworkUtil {
    private static let environment: APIEnvironment = .dev
    
    static var environmentBaseURL: String {
        switch NetworkUtil.environment {
        case .production: return AppSettings.shared.baseUrl
        case .dev: return AppSettings.shared.baseUrl
        }
    }
    
    static func generateMobileEndPointV1(lastPath: String) -> String {
        return "\(lastPath)"
    }
}
