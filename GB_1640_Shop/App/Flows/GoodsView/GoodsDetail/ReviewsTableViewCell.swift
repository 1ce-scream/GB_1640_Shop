//
//  ReviewsTableViewCell.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 21.04.2022.
//

import UIKit

class ReviewsTableViewCell: CustomCell {

    @IBOutlet weak var authorLabel: UILabel!
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
        contentView.backgroundColor = .systemBlue
        
        backView.backgroundColor = .systemTeal

        authorLabel.textColor = .systemBlue
        authorLabel.font = .systemFont(ofSize: FontSizes.smallLabel.rawValue, weight: .bold)

        textReviewTextView.contentMode = .topLeft
    }
    
}
