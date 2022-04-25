//
//  LoginViewController.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 12.04.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var loginTextField: StandartTextField!
    @IBOutlet weak var passwordTextField: StandartTextField!
    @IBOutlet weak var loginButton: StandartButton!
    @IBOutlet weak var registrationButton: StandartButton!
    
    private lazy var viewModel = LoginViewModel()
    private lazy var keyboardHelper = KeyboardHelper()
    private lazy var alert = AlertsHelper(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyboardHelper.scrollView = scrollView
        keyboardHelper.hideKeyboardGesture()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        keyboardHelper.addKeyboardObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        keyboardHelper.removeKeyboardObserver()
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
        brandNameLabel.font = .systemFont(ofSize: FontSizes.mainLabel.rawValue)
        brandNameLabel.textAlignment = .center
        brandNameLabel.textColor = .systemBackground
        brandNameLabel.accessibilityIdentifier = "brandNameLabel"
    }
    
    private func setupTextFieldsView() {
        loginTextField.placeholder = "Логин"
        loginTextField.autocapitalizationType = .words
        loginTextField.accessibilityIdentifier = "loginTF"
        
        passwordTextField.placeholder = "Пароль"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.accessibilityIdentifier = "passwordTF"
    }
    
    private func setupButtonsView() {
        loginButton.setTitle("Войти", for: .normal)
        loginButton.tintColor = .systemGreen
        loginButton.accessibilityIdentifier = "loginButton"

        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.tintColor = .systemTeal
        registrationButton.addTarget(self,
                                     action: #selector(presentRegistrationVC(_ :)),
                                     for: .touchUpInside)
        registrationButton.accessibilityIdentifier = "registrationButton"
    }
    
    @objc func presentRegistrationVC(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "MainView", bundle: nil)
        guard let destinationController = storyboard
            .instantiateViewController(withIdentifier: "RegistrationVC") as? RegistrationViewController
        else { return }
        destinationController.modalPresentationStyle = .fullScreen
        present(destinationController, animated: true, completion: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {
        
        let isDataCorrect = viewModel.checkUserData(login: loginTextField.text ?? "",
                                                        password: passwordTextField.text ?? "")
        guard isDataCorrect == true else {
            alert.showAlert(title: "Ошибка", message: "Логин или пароль не верны")
            passwordTextField.text = ""
            return false
        }
        
        viewModel.sendLoginRequest(login: loginTextField.text ?? "",
                                   password: passwordTextField.text ?? "")
        return isDataCorrect
    }
}
