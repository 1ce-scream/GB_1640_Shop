//
//  NavigationController+Ext.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 19.04.2022.
//

import UIKit

@IBDesignable extension UINavigationController {
    @IBInspectable var barTintColor: UIColor? {
        // swiftlint:disable computed_accessors_order
        set {
            navigationBar.barTintColor = newValue
        }
        get {
            guard  let color = navigationBar.barTintColor else { return nil }
            return color
        }
    }

    @IBInspectable var tintColor: UIColor? {
        // swiftlint:disable computed_accessors_order
        set {
            navigationBar.tintColor = newValue
        }
        get {
            guard  let color = navigationBar.tintColor else { return nil }
            return color
        }
    }

    @IBInspectable var titleColor: UIColor? {
        // swiftlint:disable computed_accessors_order
        set {
            guard let color = newValue else { return }
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        }
        get {
            return navigationBar
                .titleTextAttributes?[NSAttributedString.Key(rawValue: "NSForegroundColorAttributeName") ]
            as? UIColor
        }
    }
}
