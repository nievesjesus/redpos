//
//  RDPDate+Extension.swift
//  Redpos
//
//  Created by Jesus Nieves on 17/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import Foundation

extension Date {
    func timeAgo() -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
        formatter.zeroFormattingBehavior = .dropAll
        formatter.maximumUnitCount = 1
        return String(format: formatter.string(from: self, to: Date()) ?? "", locale: .current)
    }
}
