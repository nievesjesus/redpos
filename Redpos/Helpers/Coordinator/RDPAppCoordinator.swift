//
//  RDPAppCoordinator.swift
//  Redpos
//
//  Created by Jesus Nieves on 16/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import UIKit

class RDPAppCoordinator: RDPCoordinator {
    var childCoordinators = [RDPCoordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RDPHomeViewController()
        self.navigationController.pushViewController(viewController, animated: false)
    }
}
