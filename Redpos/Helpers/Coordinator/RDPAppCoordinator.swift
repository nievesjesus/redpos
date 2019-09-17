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

    let homeViewController = RDPHomeViewController()
    let detailViewcontroller = RDPDetailViewController()

    init(splitViewController: UISplitViewController, navigationController: UINavigationController) {
        self.splitViewController = splitViewController
        self.navigationController = navigationController
    }

    func start() {
        self.splitViewController.viewControllers = [self.navigationController, RDPDetailViewController()]

        self.homeViewController.coordinator = self
        self.detailViewcontroller.coordinator = self

        self.navigationController.viewControllers = [homeViewController]
        self.splitViewController.viewControllers = [self.navigationController, detailViewcontroller]
        self.splitViewController.preferredDisplayMode = .primaryOverlay
        self.splitViewController.preferredDisplayMode = .allVisible
        self.splitViewController.delegate = self
    }

    func goToDetail(model: PostModel?) {
        self.detailViewcontroller.showDetails(model: model)
        self.splitViewController.showDetailViewController(self.detailViewcontroller, sender: nil)
    }
}

extension RDPAppCoordinator: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
