//
//  ReviewsTableViewCell.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 21.04.2022.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var textReviewTextView: UITextView!
    
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
        backView.layer.cornerRadius = 12
        backView.layer.masksToBounds = true
        backView.layer.borderWidth = 1
        backView.layer.borderColor = UIColor.systemBackground.cgColor

        authorLabel.textColor = .systemBlue
        authorLabel.font = .systemFont(ofSize: FontSizes.smallLabel.rawValue, weight: .bold)
        
        textReviewTextView.textColor = .systemBackground
        textReviewTextView.backgroundColor = .clear
        textReviewTextView.font = .systemFont(ofSize: FontSizes.standartTextView.rawValue, weight: .regular)
        textReviewTextView.contentMode = .topLeft
        textReviewTextView.isEditable = false
        textReviewTextView.isSelectable = true
        textReviewTextView.isScrollEnabled = true
    }
    
}
