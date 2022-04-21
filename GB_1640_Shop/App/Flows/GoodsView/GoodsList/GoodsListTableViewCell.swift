//
//  GoodsListTableViewCell.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 18.04.2022.
//

import UIKit

class GoodsListTableViewCell: UITableViewCell {

    @IBOutlet weak var productIconImageView: AvatarImage!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
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
        productNameLabel.textColor = .systemBlue
        productNameLabel.font = .systemFont(ofSize: FontSizes.standartLabel.rawValue, weight: .bold)
        
        productDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        productDescriptionLabel.textColor = .black
        productDescriptionLabel.font = .systemFont(ofSize: FontSizes.smallLabel.rawValue, weight: .regular)
        productDescriptionLabel.numberOfLines = 0
        productDescriptionLabel.lineBreakMode = .byWordWrapping
        
        productPriceLabel.textColor = .systemBlue
        productPriceLabel.font = .systemFont(ofSize: FontSizes.smallLabel.rawValue, weight: .regular)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}