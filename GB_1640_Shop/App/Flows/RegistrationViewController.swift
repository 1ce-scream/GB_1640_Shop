//
//  RegistrationViewController.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 13.04.2022.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var registerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBlue
        
    }
    
    private func setupLablesView() {
        registerLabel.text = "Регистрация"
        registerLabel.font = .systemFont(ofSize: 30, weight: .bold)
        registerLabel.textColor = .white
    }
}
