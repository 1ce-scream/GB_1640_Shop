//
//  Colors.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 11.05.2022.
//

import UIKit

enum ButtonColors {
    case standartButton
    case subButton
    case exitButton
}

extension ButtonColors {
    var value: UIColor {
        get {
            switch self {
            case .standartButton:
                return UIColor.systemGreen
            case .subButton:
                return UIColor.systemTeal
            case .exitButton:
                return UIColor.systemRed
            }
        }
    }
}
