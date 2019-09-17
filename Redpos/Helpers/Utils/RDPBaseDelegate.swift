//
//  RDPBaseDelegate.swift
//  Redpos
//
//  Created by Jesus Nieves on 17/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

protocol RDPBaseDelegate {
    func showError()
    func onRetry()
}


extension RDPBaseDelegate where Self: RDPBaseViewController {

    func showError() {
       print("error")
    }
    
}
