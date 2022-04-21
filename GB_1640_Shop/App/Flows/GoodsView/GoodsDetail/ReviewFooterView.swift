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
        guard reviewTextField.text != "" else { return }
        viewModel.sendReview(userId: 123, text: reviewTextField.text ?? "")
        reviewTextField.text = ""
        showAlert(title: "Отзыв", message: "Ваш отзыв отправлен на модерацию")
    }
    
    private lazy var viewModel = GoodsDetailViewModel()
    weak var viewController: UIViewController?
    
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
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "OK",
            style: .cancel)
        alert.addAction(action)
        viewController?.present(alert, animated: true, completion: nil)
    }
}
