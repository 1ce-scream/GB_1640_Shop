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
    
    private let viewModel = LoginViewModel()
    
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
        loginButton.isUserInteractionEnabled = true
        loginButton.setTitle("Войти", for: .normal)
        loginButton.setTitleColor(.systemBlue, for: .normal)
        loginButton.setTitleColor(.systemRed, for: .highlighted)
        loginButton.tintColor = .white
        loginButton.addTarget(self,
                              action: #selector(presentUserDataVC(_ :)),
                              for: .touchUpInside)
        
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.isUserInteractionEnabled = true
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.setTitleColor(.systemBackground, for: .normal)
        registrationButton.setTitleColor(.systemRed, for: .highlighted)
        registrationButton.addTarget(self,
                                     action: #selector(presentRegistrationVC(_ :)),
                                     for: .touchUpInside)
    }
    
    private func showLoginError() {
        let alert = UIAlertController(
            title: "Ошибка",
            message: "Логин или пароль не верны",
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "OK",
            style: .cancel)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func presentUserDataVC(_ sender: UIButton) {
        let isDataCorrect = viewModel.checkUserData(login: loginTextField.text ?? "",
                                                    password: passwordTextField.text ?? "")
        guard isDataCorrect == true else {
            showLoginError()
            return
        }
        viewModel.sendLoginRequest(login: loginTextField.text ?? "",
                                   password: passwordTextField.text ?? "")
        
        let storyboard = UIStoryboard.init(name: "MainView", bundle: nil)
        let destinationController = storyboard
            .instantiateViewController(withIdentifier: "UserDataVC") as! UserDataViewController
        destinationController.modalPresentationStyle = .fullScreen
        present(destinationController, animated: true, completion: nil)
    }
    
    @objc func presentRegistrationVC(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "MainView", bundle: nil)
        let destinationController = storyboard
            .instantiateViewController(withIdentifier: "RegistrationVC") as! RegistrationViewController
        destinationController.modalPresentationStyle = .fullScreen
        present(destinationController, animated: true, completion: nil)
    }
}
