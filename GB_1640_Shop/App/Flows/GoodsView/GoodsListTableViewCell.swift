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
        productNameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        productDescriptionLabel.textColor = .systemBackground
        productDescriptionLabel.font = .systemFont(ofSize: 17, weight: .regular)
        productDescriptionLabel.numberOfLines = 0
        
        productPriceLabel.textColor = .systemBlue
        productPriceLabel.font = .systemFont(ofSize: 17, weight: .regular)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
