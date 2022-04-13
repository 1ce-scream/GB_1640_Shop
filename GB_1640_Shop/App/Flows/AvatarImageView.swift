//
//  AvatarImageView.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 13.04.2022.
//

import UIKit

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
