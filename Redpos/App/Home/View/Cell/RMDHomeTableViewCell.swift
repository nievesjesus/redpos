//
//  RMDHomeTableViewCell.swift
//  Redpos
//
//  Created by Jesus Nieves on 16/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import UIKit

class RMDHomeTableViewCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "This is a label"
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RMDHomeTableViewCell: RDPViewSetupable {
    
    func setupView() {
        self.contentView.addSubview(self.titleLabel)
    }
    
    func setupConstraints() {
        self.titleLabel.autoPinEdgesToSuperviewEdges()
    }
    
}

