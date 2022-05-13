//
//  GoodsListTableViewCell.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 18.04.2022.
//

import UIKit

class GoodsListTableViewCell: CustomCell {

    @IBOutlet weak var backView: CellBackground!
    @IBOutlet weak var productIconImageView: AvatarImage!
    @IBOutlet weak var productNameLabel: StandartLabel!
    @IBOutlet weak var productDescriptionLabel: SmallLabel!
    @IBOutlet weak var productPriceLabel: PriceLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForReuse() {
        productNameLabel.text = nil
        productDescriptionLabel.text = nil
        productPriceLabel.text = nil
    }
    
    func configure(product: Good) {
        productIconImageView.image = UIImage(named: "mbpTest")
        productNameLabel.text = product.productName
        productDescriptionLabel.text = product.productDescription
//        productPriceLabel.text = String(format: "%.1f", product.productPrice)
        productPriceLabel.text = "\(product.productPrice)"
    }
    
    private func setupView() {
        contentView.backgroundColor = BackgroundsColor.standart.value
        backView.backgroundColor = BackgroundsColor.secondary.value
        
        productNameLabel.accessibilityIdentifier = "productNameLabel"
        
        productDescriptionLabel.numberOfLines = 0
        productDescriptionLabel.lineBreakMode = .byWordWrapping
        
        productPriceLabel.font = .systemFont(ofSize: FontSizes.smallLabel.rawValue, weight: .semibold)
    }
}
