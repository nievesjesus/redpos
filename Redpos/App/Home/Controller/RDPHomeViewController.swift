//
//  RDPHomeViewController.swift
//  Redpos
//
//  Created by Jesus Nieves on 16/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import UIKit

class RDPHomeViewController: RDPBaseViewController {
    
    let homeView = RDPHomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupConstraints()
    }
    
}

extension RDPHomeViewController: RDPViewSetupable {
    func setupView() {
        self.homeView.tableView.delegate = self
        self.homeView.tableView.dataSource = self
        self.view.addSubview(self.homeView)
    }
    
    func setupConstraints() {
        self.homeView.autoPinEdgesToSuperviewEdges()
    }

}

extension RDPHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RMDHomeTableViewCell.idCell, for: indexPath) as? RMDHomeTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
}
