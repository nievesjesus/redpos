//
//  RedosNetworking.swift
//  Redpos
//
//  Created by Jesus Nieves on 17/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import UIKit

public enum Result<T> {
    case success(T)
    case failure(Error)
}

final class RedosNetworking: NSObject {

    private static func getData(url: URL,
                                completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

    public static func downloadImage(url: URL,
                                     completion: @escaping (Result<Data>) -> Void) {
        RedosNetworking.getData(url: url) { data, _, error in

            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data, error == nil else {
                return
            }

            DispatchQueue.main.async {
                completion(.success(data))
            }
        }
    }
}
