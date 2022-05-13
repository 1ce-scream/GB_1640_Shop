//
//  BasketViewController.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 25.04.2022.
//

import UIKit
import Firebase

class BasketViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cleanBasketButton: UIBarButtonItem!
    
    @IBAction func tapCleanBasketButton(_ sender: Any) {
        BasketSingleton.shared.basket.removeAll()
        self.goodsList.removeAll()
        self.tableView.reloadData()
        
        Crashlytics.setLog(log: .removeFromBasket)
    }
    
    private lazy var viewModel = BasketViewModel()
    private lazy var alert = AlertsHelper(viewController: self)
    private var goodsList = [Good]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        registerNib()
        setContent()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setContent()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .onDrag
        tableView.backgroundColor = BackgroundsColor.standart.value
        tableView.accessibilityIdentifier = "basketTable"
    }
    
    private func registerNib() {
        let nibProduct = UINib(nibName: "GoodsListTableViewCell", bundle: nil)
        tableView.register(nibProduct,
                           forCellReuseIdentifier: "GoodsListTableViewCell")
        tableView.register(BasketFooterView.nib,
                           forHeaderFooterViewReuseIdentifier: "BasketFooterView"
        )
    }
    
    private func setContent() {
        self.goodsList = BasketSingleton.shared.basket
        self.tableView.reloadData()
    }
    
}

extension BasketViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return goodsList.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "GoodsListTableViewCell",
                for: indexPath) as? GoodsListTableViewCell
        else { return UITableViewCell() }
        
        cell.configure(product: goodsList[indexPath.row])
        cell.accessibilityIdentifier = "basketCell_\(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let currentProduct = goodsList[indexPath.row]
            viewModel.sendRemoveFromBasketRequest(productId: currentProduct.id ?? 123)
            BasketSingleton.shared.basket.remove(at: indexPath.row)
            self.goodsList.remove(at: indexPath.row)
            self.tableView.reloadData()
            
            Crashlytics.setLog(log: .removeFromBasket)
        }
    }
    
    func tableView(_ tableView: UITableView,
                   viewForFooterInSection section: Int) -> UIView? {
        
        guard let footer = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "BasketFooterView") as? BasketFooterView
        else { return nil }
        
        let calculatePrice = goodsList.map { $0.productPrice }.reduce(0.0, +)
        
        footer.configure(amount: goodsList.count,
                         price: calculatePrice)
        footer.payButton.addTarget(self,
                                   action: #selector(tapPayButton(_ :)),
                                   for: .touchUpInside)
        footer.accessibilityIdentifier = "basketFooter"
//        footer.payButton.accessibilityIdentifier = "payButton"
        
        return footer
    }
    
    @objc func tapPayButton(_ sender: UIButton) {
        guard goodsList.isEmpty != true else {
            alert.showAlert(title: "Ошибка", message: "Корзина пуста")
            return
        }
        
        viewModel.payBasket()
        BasketSingleton.shared.basket.removeAll()
        self.goodsList.removeAll()
        self.tableView.reloadData()
        alert.showAlert(title: "Stub", message: "Stub")
        
        Crashlytics.setLog(log: .payBasket)
    }
}

// MARK: - UITableViewDelegate

extension BasketViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        defer {
            // Метод для снятия выделения с ячейки
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
}
