//
//  RDPHomePresenter.swift
//  Redpos
//
//  Created by Jesus Nieves on 16/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import Foundation

class RDPHomePresenter {

    private var delegate: HomeDelegate
    private var postsList: [PostModel]?

    init(delegate: HomeDelegate) {
        self.delegate = delegate
    }

    func getLastestPost() {
        RedposRequest<[PostModel]>.request(path: "data.children", delegate: self.delegate, url: "https://www.reddit.com/top.json?limit=50") { (response) in
            self.postsList = response
            self.delegate.willBuildPostList()
        }
    }

    func getNumberOfRows () -> Int {
        return self.postsList?.count ?? 0
    }

    func getRowAt(_ indexPath: Int) -> PostModel? {
        return self.postsList?[indexPath]
    }

    func setReaded(_ indexPath: Int) {
        self.postsList?[indexPath].data.readed = true
        self.delegate.willBuildPostList()
    }
}
