//
//  RDPStyleManager.swift
//  Redpos
//
//  Created by Jesus Nieves on 16/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import UIKit

enum RDPStyleManager {
    
    enum Color: String {
        case main = "#FF003C"
        case regularGray = "#6A6A6A"
        case softGray = "#D8D8D8"
        case bluePurple = "#080040"
        case softBlue = "#2CC2DC"
        
        func color() -> UIColor {
            return UIColor(hex: self.rawValue)
        }
    }

    
    enum Font {
        enum Size: CGFloat {
            case large = 20
            case medium = 17
            case small = 14
            case xsmall = 13
            case tiny = 10
        }
        
        case light
        case black
        case book
        case heavy
        case medium
        case oblique
        case roman
        
        func font(size: Size) -> UIFont {
            let fontSize = size.rawValue
            
            switch self {
            case .light:
                return UIFont.lightFont(ofSize: fontSize)
            case .black:
                return UIFont.blackFont(ofSize: fontSize)
            case .book:
                return UIFont.bookFont(ofSize: fontSize)
            case .heavy:
                return UIFont.heavyFont(ofSize: fontSize)
            case .medium:
                return UIFont.mediumFont(ofSize: fontSize)
            case .oblique:
                return UIFont.obliqueFont(ofSize: fontSize)
            case .roman:
                return UIFont.romanFont(ofSize: fontSize)
            }
        }
    }
    
}

