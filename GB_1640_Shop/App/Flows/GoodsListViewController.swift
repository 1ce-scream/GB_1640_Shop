//
//  GoodsListViewController.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 18.04.2022.
//

import UIKit

class GoodsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = GoodsListViewModel()
    private var goodsList = [Good]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        setContent()
        setupTableView()
        registerNib()
        
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .onDrag
        tableView.backgroundColor = .systemBlue
    }
    
    private func registerNib() {
        let nibProduct = UINib(nibName: "GoodsListTableViewCell", bundle: nil)
        tableView.register(nibProduct, forCellReuseIdentifier: "GoodsListTableViewCell")
    }
    
    private func setContent() {
        viewModel.sendGoodsListRequest() { productList in
            self.goodsList = productList
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension GoodsListViewController: UITableViewDataSource {
    
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
        
        return cell
    }
    
//    func tableView(_: UITableView,
//                            estimatedHeightForRowAt _: IndexPath) -> CGFloat {
//
//        return 130
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 130
//    }
}

// MARK: - UITableViewDelegate

extension GoodsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        defer {
            // Метод для снятия выделения с ячейки
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
}
