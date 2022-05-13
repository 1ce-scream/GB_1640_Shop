//
//  ReviewFooterView.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 21.04.2022.
//

import UIKit
import Firebase

class ReviewFooterView: UITableViewHeaderFooterView {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var reviewTextField: UITextField!
    
    @IBAction func tapSendReviewButton(_ sender: Any) {
        guard reviewTextField.text != "" else { return }
        viewModel.sendReview(userId: 123,
                             text: reviewTextField.text ?? "")
        reviewTextField.text = ""
        alert.showAlert(title: "Отлично!", message: "Ваш отзыв отправлен на модерацию")
        
        Crashlytics.setLog(log: .sendReview)
    }
    
    private lazy var viewModel = GoodsDetailViewModel()
    private lazy var alert = AlertsHelper(viewController: viewController)
    weak var viewController: UIViewController?
    
    // swiftlint:disable identifier_name
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backView.backgroundColor = BackgroundsColor.standart.value
        self.reviewTextField.placeholder = "Оставить отзыв"
        self.reviewTextField.font = .systemFont(ofSize: FontSizes.smallLabel.rawValue,
                                                weight: .regular)
    }
}
