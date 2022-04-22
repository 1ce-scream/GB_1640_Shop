//
//  GoodsListViewController.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 18.04.2022.
//

import UIKit

class GoodsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private lazy var viewModel = GoodsListViewModel()
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
        viewModel.sendGoodsListRequest(completion: ) { productList in
            self.goodsList = productList
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        guard let destinationVC = segue.destination
                as? GoodsDetailViewController
        else { return }
        
        if let index = tableView.indexPathForSelectedRow {
            destinationVC.good = goodsList[index.row]
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
    
}

// MARK: - UITableViewDelegate

extension GoodsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "listToDetailGoods", sender: self)
        
        defer {
            // Метод для снятия выделения с ячейки
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
}
