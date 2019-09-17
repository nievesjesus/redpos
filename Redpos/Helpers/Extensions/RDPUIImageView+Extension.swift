//
//  RDPUIImageView+Extension.swift
//  Redpos
//
//  Created by Jesus Nieves on 17/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {

    func loadThumbnail(urlSting: String) {
        guard let url = URL(string: urlSting) else { return }
        image = nil

        if let imageFromCache = imageCache.object(forKey: urlSting as AnyObject) {
            image = imageFromCache as? UIImage
            return
        }
        RedosNetworking.downloadImage(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                guard let imageToCache = UIImage(data: data) else { return }
                imageCache.setObject(imageToCache, forKey: urlSting as AnyObject)
                self.image = UIImage(data: data)
            case .failure:
                self.image = UIImage(named: "no-image")
            }
        }
    }
}
