//
//  ReviewFooterView.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 21.04.2022.
//

import UIKit

class ReviewFooterView: UITableViewHeaderFooterView {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var reviewTextField: UITextField!
    
    @IBAction func tapSendReviewButton(_ sender: Any) {
        guard reviewTextField.text != nil else { return }
        viewModel.sendReview(userId: 123, text: reviewTextField.text ?? "")
        reviewTextField.text = ""
    }
    
    private lazy var viewModel = GoodsDetailViewModel()
    
    // swiftlint:disable identifier_name
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backView.backgroundColor = .systemBlue
        self.reviewTextField.placeholder = "Оставить отзыв"
        self.reviewTextField.font = .systemFont(
            ofSize: FontSizes.smallLabel.rawValue,
            weight: .regular)
    }
}
