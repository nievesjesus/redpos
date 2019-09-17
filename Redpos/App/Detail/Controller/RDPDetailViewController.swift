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
        self.detailView.delegate = self
        self.view.addSubview(self.detailView)
    }

    func setupConstraints() {
        self.detailView.autoPinEdgesToSuperviewEdges()
    }
}

extension RDPDetailViewController: DetailViewDelegate {
    func savePhotoFailed(error: Error) {
        let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(ac, animated: true)
    }
    
    func savePhotoSuccess() {
        let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    
}

extension RDPDetailViewController {

    func showDetails(model: PostModel?) {
        self.detailView.model = model
    }
}
