//
//  CustomViews.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 21.04.2022.
//

import UIKit

class StandartLabel: UILabel {
    
    override func awakeFromNib() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = .systemFont(ofSize: FontSizes.standartLabel.rawValue, weight: .bold)
        self.textColor = .systemBackground
    }
}

class AvatarImage: UIImageView {
    private var borderColor: UIColor = .white
    private var borderWidth: CGFloat = 0.8
    
    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.backgroundColor = .systemBackground
    }
}

class AvatarBackgroundShadowView: UIView {
    // Цвет тени
    private var shadowColor: UIColor = .systemGray
    // Удаленность тени от поля зрения
    private var shadowOffset: CGSize = CGSize(width: 3.0, height: 2.5)
    // Прозрачность тени
    private var shadowOpacity: Float = 0.9
    // Степень размытия тени
    private var shadowRadius: CGFloat = 3.0

    override func awakeFromNib() {
        // Цвет фона View
        self.backgroundColor = .clear
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
    }
}

class CellBackground: UIView {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemBackground.cgColor
    }
}

class StandartTextView: UITextView {
    
    override func awakeFromNib() {
        self.isUserInteractionEnabled = true
        self.isEditable = false
        self.isSelectable = true
        self.isScrollEnabled = true
        self.backgroundColor = .clear
        self.textColor = .systemBackground
        self.font = .systemFont(ofSize: FontSizes.standartTextView.rawValue, weight: .regular)
    }
}

class SubTextView: UITextView {
    
    override func awakeFromNib() {
        self.isUserInteractionEnabled = true
        self.isEditable = false
        self.isSelectable = true
        self.isScrollEnabled = false
        self.font = .systemFont(ofSize: FontSizes.standartLabel.rawValue, weight: .regular)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.systemBackground.cgColor
        self.layer.borderWidth = 1
    }
}

class StandartTextField: UITextField {
    
    override func awakeFromNib() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.borderStyle = .roundedRect
        self.font = .systemFont(ofSize: FontSizes.standartTextFields.rawValue)
        self.backgroundColor = .systemBackground
        self.textColor = .systemBlue
        self.autocapitalizationType = .none
    }
}

class StandartButton: UIButton {

    override func awakeFromNib() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
        self.setTitleColor(.systemBackground, for: .normal)
        self.setTitleColor(.systemRed, for: .highlighted)
    }
    
//    override func updateConfiguration() {
//        
//    }
}

class SubButton: UIButton {

    override func awakeFromNib() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
        self.setTitleColor(.systemBackground, for: .normal)
        self.setTitleColor(.systemRed, for: .highlighted)
        self.tintColor = .systemBackground
        self.backgroundColor = .systemTeal
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
}
