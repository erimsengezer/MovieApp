//
//  Coordinator.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import UIKit

protocol  Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    
    func start()
}
