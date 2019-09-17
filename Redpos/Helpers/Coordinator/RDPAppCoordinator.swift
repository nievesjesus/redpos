//
//  RDPAppCoordinator.swift
//  Redpos
//
//  Created by Jesus Nieves on 16/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import UIKit

class RDPAppCoordinator: RDPCoordinator {
    var splitViewController: UISplitViewController
    var navigationController: UINavigationController

    init(splitViewController: UISplitViewController, navigationController: UINavigationController) {
        self.splitViewController = splitViewController
        self.navigationController = navigationController
    }

    func start() {
        self.splitViewController.viewControllers = [self.navigationController, RDPDetailViewController()]

        let homeViewController = RDPHomeViewController()
        homeViewController.coordinator = self
        self.navigationController.viewControllers = [homeViewController]

        let detailViewcontroller = RDPDetailViewController()
        detailViewcontroller.coordinator = self

        self.splitViewController.viewControllers = [self.navigationController, detailViewcontroller]
        self.splitViewController.preferredDisplayMode = .primaryOverlay
        self.splitViewController.preferredDisplayMode = .allVisible
        self.splitViewController.delegate = self
    }

    func goToDetail() {
        let viewController = RDPDetailViewController()
        viewController.coordinator = self
        self.splitViewController.showDetailViewController(viewController, sender: nil)
    }
}

extension RDPAppCoordinator: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
