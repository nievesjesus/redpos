//
//  RDPDetailViewController.swift
//  Redpos
//
//  Created by Jesus Nieves on 16/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import UIKit

class RDPDetailViewController: RDPBaseViewController {

    let detailView = RDPDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupConstraints()
    }
}

extension RDPDetailViewController: RDPViewSetupable {

    func setupView () {
        self.view.addSubview(self.detailView)
    }

    func setupConstraints() {
        self.detailView.autoPinEdgesToSuperviewEdges()
    }
}
