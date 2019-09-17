//
//  RDPHomeModel.swift
//  Redpos
//
//  Created by Jesus Nieves on 17/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

struct PostModel: Codable {
    let kind: String
    var data: DataModel
}

struct DataModel: Codable {
    let id: String
    let title: String
    let author: String
    let numComments: Int
    let thumbnail: String
    let createdUtc: Double
    var readed: Bool? = false
}

protocol HomeDelegate: class, RDPBaseDelegate {
    func willBuildPostList()
}
