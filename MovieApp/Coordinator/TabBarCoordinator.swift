//
//  TabBarCoordinator.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import UIKit

class TabBarCoordinator: Coordinator {
    private enum Constants {
        enum Color {
            static let tabBarTintColor: UIColor = .black
            static let backgroundColor: UIColor = .white
            static let barTintColor: UIColor = .white
        }
        
        enum Title {
            static let homeScreenTitle: String = "Home"
        }
    }
    
    
    var navigationController: UINavigationController
    let tabBarController: UITabBarController
    
    var mainViewCoordinator: Coordinator
    
    init() {
        navigationController = UINavigationController()
        tabBarController = UITabBarController()
        
        tabBarController.tabBar.tintColor = Constants.Color.tabBarTintColor
        tabBarController.tabBar.backgroundColor = Constants.Color.backgroundColor
        tabBarController.tabBar.barTintColor = Constants.Color.barTintColor
        
        mainViewCoordinator = MainViewCoordinator()
    }
    
    func start() {
        mainViewCoordinator.start()
        
        mainViewCoordinator.navigationController.topViewController?.title = Constants.Title.homeScreenTitle
        
        let controllers: [UIViewController] = [
            mainViewCoordinator.navigationController,
        ]
        
        tabBarController.setViewControllers(controllers, animated: false)
        tabBarController.selectedIndex = TabbarItemPositionType.home.rawValue
    }
    
    
}
