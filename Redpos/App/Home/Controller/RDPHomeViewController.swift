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
    private lazy var presenter = RDPHomePresenter(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupConstraints()
        self.presenter.getLastestPost()
    }

}

extension RDPHomeViewController: RDPViewSetupable {
    func setupView() {
        let image = UIImage(named: "logo-top")?.withRenderingMode(.alwaysOriginal)
        let logoTop = UIBarButtonItem(image: image, landscapeImagePhone: nil, style: .done, target: self, action: nil)
        self.navigationItem.leftBarButtonItems = [logoTop   ]

        self.homeView.delegate = self
        self.homeView.tableView.delegate = self
        self.homeView.tableView.dataSource = self

        self.view.addSubview(self.homeView)
    }

    func setupConstraints() {
        self.homeView.autoPinEdgesToSuperviewEdges()
    }

}

extension RDPHomeViewController: HomeViewDelegate {

    func willPullRefresh() {
        self.presenter.getLastestPost()

    }

}

extension RDPHomeViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RMDHomeTableViewCell.idCell,
                                                       for: indexPath) as? RMDHomeTableViewCell else {
            return UITableViewCell()
        }
        cell.model = self.presenter.getRowAt(indexPath.row)
        cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.setReaded(indexPath.row)
        self.coordinator?.goToDetail(model: self.presenter.getRowAt(indexPath.row))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.getNumberOfRows()
    }

}

extension RDPHomeViewController: HomeDelegate {

    func willBuildPostList() {
        DispatchQueue.main.async {
            self.homeView.tableView.reloadData()
            self.homeView.refreshControl.endRefreshing()
        }
    }

    func onRetry() {
        self.errorView?.onRetryPressed = {
            self.presenter.getLastestPost()
        }
    }
}

extension RDPHomeViewController: HomeTableViewCellDelegate {

    func willRemovePost(model: PostModel?) {
        guard let model = model, let index = self.presenter.getModelIndex(model) else { return }
        self.presenter.removePostAt(index)
        self.homeView.tableView.reloadSections([0], with: .fade)
    }
    
}
