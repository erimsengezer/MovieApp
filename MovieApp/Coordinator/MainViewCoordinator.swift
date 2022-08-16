//
//  MainViewCoordinator.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import UIKit

protocol MainViewCoordinatorProtocol {
    
}

class MainViewCoordinator: Coordinator {
    var navigationController: UINavigationController = UINavigationController()
    
    func start() {
        guard let appCoordinator = UIApplication.shared.appCoordinator else { return }
        guard let homeView = MainBuilder.generate(coordinatorProtocol: appCoordinator) else { return }
        
        homeView.tabBarItem.title = TabBarItem.home.title
        navigationController = UINavigationController(rootViewController: homeView)
    }
}
