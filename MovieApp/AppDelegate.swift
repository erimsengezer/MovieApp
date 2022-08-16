//
//  AppDelegate.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: ApplicationCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }

        self.coordinator = ApplicationCoordinator(window: window)
        self.coordinator?.start()
        
        return true
    }
}

