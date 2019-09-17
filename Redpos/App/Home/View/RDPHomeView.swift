//
//  RDPHomeView.swift
//  Redpos
//
//  Created by Jesus Nieves on 16/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import UIKit

class RDPHomeView: UIView {
    
    lazy var tableView: UITableView = {
        let table = UITableView.newAutoLayout()
        table.register(RMDHomeTableViewCell.self, forCellReuseIdentifier: RMDHomeTableViewCell.idCell)
        table.tableFooterView = UIView()
        table.separatorColor = .clear
        table.estimatedRowHeight = 84
        table.backgroundColor = .clear
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RDPHomeView: RDPViewSetupable {
    
    func setupView() {
        self.backgroundColor = .white
        self.addSubview(self.tableView)
    }
    
    func setupConstraints() {
        self.tableView.autoPinEdgesToSuperviewEdges()
    }
    
}
