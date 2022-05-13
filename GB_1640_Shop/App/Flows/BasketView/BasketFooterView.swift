//
//  BasketFooter.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 25.04.2022.
//

import UIKit

class BasketFooterView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var productsAmountLabel: SmallLabel!
    @IBOutlet weak var productsPriceLabel: SmallLabel!
    @IBOutlet weak var payButton: StandartButton!
    
    // swiftlint:disable identifier_name
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.backView.backgroundColor = BackgroundsColor.standart.value
        payButton.accessibilityIdentifier = "payButton"
    }
    
    func configure(amount: Int, price: Double) {
        self.productsAmountLabel.text = "Количество товаров: \(amount)"
        self.productsPriceLabel.text = "Общая стоимость: \(price)"
        
    }
}
