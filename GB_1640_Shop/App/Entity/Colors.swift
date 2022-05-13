//
//  Colors.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 11.05.2022.
//

import UIKit

enum ButtonColors {
    /// Green
    case standart
    /// Teal
    case secondary
    /// Red
    case exit
}

enum TextColors {
    /// Background
    case standart
    /// Blue
    case secondary
}

enum BackgroundsColor {
    /// Blue
    case standart
    /// Clear
    case secondary
    /// Background
    case system
    /// Teal
    case extra
}

extension ButtonColors {
    var value: UIColor {
        // swiftlint:disable implicit_getter
        get {
            switch self {
            case .standart:
                return UIColor.systemGreen
            case .secondary:
                return UIColor.systemTeal
            case .exit:
                return UIColor.systemRed
            }
        }
    }
}

extension TextColors {
    var value: UIColor {
        // swiftlint:disable implicit_getter
        get {
            switch self {
            case .standart:
                return UIColor.systemBackground
            case .secondary:
                return UIColor.systemBlue
            }
        }
    }
}

extension BackgroundsColor {
    var value: UIColor {
        // swiftlint:disable implicit_getter
        get {
            switch self {
            case .standart:
                return UIColor.systemBlue
            case .secondary:
                return UIColor.clear
            case .system:
                return UIColor.systemBackground
            case .extra:
                return UIColor.systemTeal
            }
        }
    }
}
