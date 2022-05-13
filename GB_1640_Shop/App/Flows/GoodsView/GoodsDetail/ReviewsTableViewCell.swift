//
//  ReviewsTableViewCell.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 21.04.2022.
//

import UIKit

class ReviewsTableViewCell: CustomCell {

    @IBOutlet weak var authorLabel: PriceLabel!
    @IBOutlet weak var backView: CellBackground!
    @IBOutlet weak var textReviewTextView: StandartTextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForReuse() {
        authorLabel.text = nil
        textReviewTextView.text = nil
    }
    
    func configure(review: Reviews) {
        authorLabel.text = review.author
        textReviewTextView.text = review.text
    }
    
    private func setupView() {
        contentView.backgroundColor = BackgroundsColor.standart.value
        
        backView.backgroundColor = BackgroundsColor.extra.value

        textReviewTextView.contentMode = .topLeft
    }
    
}
