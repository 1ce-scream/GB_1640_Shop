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
    @IBOutlet weak var productDescriptionTextView: StandartTextView!
    @IBOutlet weak var reviewsTableView: UITableView!
    @IBOutlet weak var addToBasketButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func tapAddToBasketButton(_ sender: Any) {
        guard let currentGood = good else { return }
       
        BasketSingleton.shared.basket.append(currentGood)
        
        viewModel.addProductToBasket(productId: good?.id ?? 123)
        alert.showAlert(title: "Корзина", message: "Товар добавлен в корзину")
    }
    
    private lazy var viewModel = GoodsDetailViewModel()
    private lazy var keyboardHelper = KeyboardHelper()
    private lazy var alert = AlertsHelper(viewController: self)
    private var reviewList = [Reviews]()
    
    var good: Good?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyboardHelper.scrollView = scrollView
        keyboardHelper.hideKeyboardGesture()
        setupScrollView()
        setupTableView()
        registerNib()
        setupView()
        getReviewData(product: good!)
        addToBasketButton.accessibilityIdentifier = "addToBasket"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        keyboardHelper.addKeyboardObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        keyboardHelper.removeKeyboardObserver()
    }
    
    private func setupScrollView() {
        scrollView.delaysContentTouches = true
        scrollView.canCancelContentTouches = false
    }
    
    private func setupTableView() {
        reviewsTableView.dataSource = self
        reviewsTableView.delegate = self
        reviewsTableView.keyboardDismissMode = .onDrag
        reviewsTableView.backgroundColor = .systemBlue
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
        productNameLabel.accessibilityIdentifier = "productName"
        
        productDescriptionTextView.text = good?.productDescription
    }
    
    private func getReviewData(product: Good) {
        viewModel.sendGoodsListRequest(productId: product.id ?? 123) { response in
            self.reviewList = response
            self.reviewList.append(Reviews(author: "Somebody",
                                           text: "A lot of text A lot of text A lot of text A lot of text"))
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
        
        footer.viewController = self
        
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
        
        defer {
            // Метод для снятия выделения с ячейки
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
}
