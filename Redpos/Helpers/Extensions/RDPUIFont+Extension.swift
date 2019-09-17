//
//  RDPUIFont+Extension.swift
//  Redpos
//
//  Created by Jesus Nieves on 16/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import UIKit

extension UIFont {
    private static func customFont(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
        assert(font != nil, "Can't load font: \(name)")
        return font ?? UIFont.systemFont(ofSize: size)
    }

    static func romanFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "AvenirLTStd-Roman", size: size)
    }

    static func obliqueFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "AvenirLTStd-Oblique", size: size)
    }

    static func mediumFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "AvenirLTStd-Medium", size: size)
    }

    static func heavyFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "AvenirLTStd-Heavy", size: size)
    }
    static func bookFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "AvenirLTStd-Book", size: size)
    }

    static func lightFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "AvenirLTStd-Light", size: size)
    }

    static func blackFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "AvenirLTStd-Black", size: size)
    }

}
