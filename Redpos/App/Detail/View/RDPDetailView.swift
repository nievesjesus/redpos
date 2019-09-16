//
//  RDPDetailView.swift
//  Redpos
//
//  Created by Jesus Nieves on 16/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import UIKit

class RDPDetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RDPDetailView: RDPViewSetupable {
    
    func setupView() {
    }
    
    func setupConstraints() {
    }
    
}

