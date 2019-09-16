//
//  RedposRequest.swift
//  Redpos
//
//  Created by Jesus Nieves on 16/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import Foundation

protocol BaseDelegate {
    
}

struct RedposRequest<Model: Codable> {
    
    typealias SuccessCompletionHandler = (_ response: Model) -> Void
    
    static func request(path: String, delegate: BaseDelegate, url: String, success successCallback: @escaping SuccessCompletionHandler) {
        print("Yeah");
    }
}

