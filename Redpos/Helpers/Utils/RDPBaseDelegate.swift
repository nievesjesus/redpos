//
//  RDPBaseDelegate.swift
//  Redpos
//
//  Created by Jesus Nieves on 17/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

protocol RDPBaseDelegate: class {
    func showError()
    func onRetry()
}

extension RDPBaseDelegate where Self: RDPBaseViewController {

    func showError() {
        self.errorView.removeFromSuperview()
        DispatchQueue.main.async { [weak self] in
            self?.onRetry()
            if let view = self?.view, let errorView = self?.errorView {
                view.addSubview(errorView)
                errorView.autoPinEdgesToSuperviewEdges()
            }
        }
        return
    }

}
