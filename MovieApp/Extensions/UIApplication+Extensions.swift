//
//  UIApplication+Extensions.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import Foundation
import UIKit

extension UIApplication {
    
    var appCoordinator: ApplicationCoordinator? {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return delegate.coordinator
    }
}

public extension UIApplication {
    private func topViewController(of viewController: UIViewController) -> UIViewController {
        if let presented = viewController.presentedViewController {
            return topViewController(of: presented)
        }
        else if let navigation = viewController as? UINavigationController {
            if let visible = navigation.visibleViewController {
                return topViewController(of: visible)
            }
            else if let last = navigation.topViewController {
                return topViewController(of: last)
            }
            return navigation
        }
        else if let tabBar = viewController as? UITabBarController {
            if let selected = tabBar.selectedViewController {
                return topViewController(of: selected)
            }
            else if let first = tabBar.viewControllers?.first {
                return topViewController(of: first)
            }
            return tabBar
        }
        else {
            return viewController
        }
    }
    
    func topViewController() -> UIViewController? {
        guard let root = self.delegate?.window??.rootViewController else { return nil }
        return topViewController(of: root)
    }
}
