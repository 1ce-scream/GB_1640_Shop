//
//  GoodsDetailViewController.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 19.04.2022.
//

import UIKit

class GoodsDetailViewController: UIViewController {

    @IBOutlet weak var productIconImageView: AvatarImage!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionTextView: UITextView!
    @IBOutlet weak var reviewsTableView: UITableView!
    @IBOutlet weak var addToBasketButton: UIButton!
    
    @IBAction func tapAddToBasketButton(_ sender: Any) {
        viewModel.addProductToBasket(productId: good?.id ?? 123)
    }
    
    private let viewModel = GoodsDetailViewModel()
    private var reviewList = [Reviews]()
    
    var good: Good?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        registerNib()
        setupView()
        getReviewData(product: good!)
    }

    private func setupTableView() {
        reviewsTableView.dataSource = self
        reviewsTableView.delegate = self
        reviewsTableView.keyboardDismissMode = .onDrag
        reviewsTableView.backgroundColor = .systemBlue
        reviewsTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func registerNib() {
        let nibProduct = UINib(nibName: "ReviewsTableViewCell", bundle: nil)
        reviewsTableView.register(nibProduct, forCellReuseIdentifier: "ReviewsCell")
        
        reviewsTableView.register(ReviewFooterView.nib,
                           forHeaderFooterViewReuseIdentifier: "ReviewFooterView"
        )
    }
    
    private func setupView() {
        productIconImageView.image = UIImage(named: "mbpTest")
        
        productNameLabel.text = good?.productName
        productNameLabel.font = .systemFont(ofSize: FontSizes.bigLabel.rawValue, weight: .semibold)
        productNameLabel.textColor = .systemBackground
        productNameLabel.textAlignment = .center
        
        productDescriptionTextView.text = good?.productDescription
        productDescriptionTextView.backgroundColor = .clear
        productDescriptionTextView.textColor = .systemBackground
        productDescriptionTextView.font = .systemFont(
            ofSize: FontSizes.standartTextView.rawValue,
            weight: .regular)
        productDescriptionTextView.isSelectable = true
        productDescriptionTextView.isEditable = false
        productDescriptionTextView.isScrollEnabled = true
    }
    
    private func getReviewData(product: Good) {
        viewModel.sendGoodsListRequest(productId: product.id ?? 123) { response in
            self.reviewList = response
            self.reviewsTableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension GoodsDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return reviewList.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ReviewsCell",
                for: indexPath) as? ReviewsTableViewCell
        else { return UITableViewCell() }
        
        cell.configure(review: reviewList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Отзывы"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .systemBackground
            headerView.textLabel?.textAlignment = .center
        }
    }
    
    func tableView(_ tableView: UITableView,
                   viewForFooterInSection section: Int) -> UIView? {
        
        guard let footer = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "ReviewFooterView") as? ReviewFooterView
        else { return nil }
        
        return footer
    }
    
    func tableView(_ tableView: UITableView,
                   heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView,
                   estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
}

// MARK: - UITableViewDelegate

extension GoodsDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
//        performSegue(withIdentifier: "listToDetailGoods", sender: self)
        
        defer {
            // Метод для снятия выделения с ячейки
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
}
