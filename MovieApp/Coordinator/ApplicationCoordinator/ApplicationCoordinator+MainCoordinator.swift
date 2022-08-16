//
//  ApplicationCoordinator+MainCoordinator.swift
//  MovieApp
//
//  Created by Erim Şengezer on 16.08.2022.
//

import UIKit

extension ApplicationCoordinator: MainViewCoordinatorProtocol {
    func detailScreen(id: String) {
        guard let detailScreen = DetailBuilder.generate(id: id, coordinatorProtocol: self) else { return }
        navigate(detailScreen)
    }
}
