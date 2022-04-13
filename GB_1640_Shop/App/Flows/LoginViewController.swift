//
//  LoginViewController.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 12.04.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBlue
        setupLabelsView()
        setupTextFieldsView()
        setupButtonsView()
    }
    
    private func setupLabelsView() {
        brandNameLabel.translatesAutoresizingMaskIntoConstraints = false
        brandNameLabel.text = "GBShop"
        brandNameLabel.font = .systemFont(ofSize: 40)
        brandNameLabel.textAlignment = .center
        brandNameLabel.textColor = .systemBackground
    }
    
    private func setupTextFieldsView() {
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.borderStyle = .roundedRect
        loginTextField.font = .systemFont(ofSize: 18)
        loginTextField.autocapitalizationType = .none
        loginTextField.backgroundColor = .systemBackground
        loginTextField.placeholder = "Логин"
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.font = .systemFont(ofSize: 18)
        passwordTextField.autocapitalizationType = .none
        passwordTextField.backgroundColor = .systemBackground
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Пароль"
    }
    
    private func setupButtonsView() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Войти", for: .normal)
        loginButton.setTitleColor(.systemBlue, for: .normal)
        loginButton.setTitleColor(.systemRed, for: .highlighted)
        loginButton.tintColor = .white
//        loginButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.setTitleColor(.systemBackground, for: .normal)
        registrationButton.setTitleColor(.systemRed, for: .highlighted)
//        registrationButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
    }
}
