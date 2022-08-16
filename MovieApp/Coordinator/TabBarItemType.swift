//
//  TabBarItemType.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import UIKit

enum TabbarItemPositionType: Int {
    case home = 0
    case favorites = 1
}

enum TabBarItem {
    private enum Constants {
        enum Title {
            static let home: String = "HOME"
            static let favorites: String = "PROFILE"
        }
    }
    
    case home
    case favorites
    
    var title: String {
        switch self {
        case .home:
            return Constants.Title.home
        case .favorites:
            return Constants.Title.favorites
        }
    }
}
