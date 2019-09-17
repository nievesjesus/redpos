//
//  RDPCoordinator.swift
//  Redpos
//
//  Created by Jesus Nieves on 16/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import UIKit

protocol RDPCoordinator {
    var navigationController: UINavigationController { get set }
    var splitViewController: UISplitViewController { get set }
    func start()
}
