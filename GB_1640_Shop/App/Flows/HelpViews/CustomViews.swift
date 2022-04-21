//
//  CustomViews.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 21.04.2022.
//

import UIKit

class StandartLabel: UILabel {
    
    override func awakeFromNib() {
        self.font = .systemFont(ofSize: FontSizes.standartLabel.rawValue, weight: .bold)
        self.textColor = .systemBlue
        self.translatesAutoresizingMaskIntoConstraints = false
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
        self.isEditable = false
        self.isSelectable = true
        self.isScrollEnabled = true
        self.backgroundColor = .clear
        self.textColor = .systemBackground
        self.font = .systemFont(ofSize: FontSizes.standartTextView.rawValue, weight: .regular)
        
//        userNameTextView.translatesAutoresizingMaskIntoConstraints = false
//        userNameTextView.text = "\(demoUser.name) \(demoUser.lastname)"
//        userNameTextView.textAlignment = .center
//        userNameTextView.textColor = .systemBlue
//        userNameTextView.font = .systemFont(ofSize: FontSizes.bigTextView.rawValue, weight: .bold)
//        userNameTextView.isScrollEnabled = false
    }
}

class StandratTextField: UITextField {
    
}
