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
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    
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
    }
    
    private func setupTextFieldsView() {
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.borderStyle = .roundedRect
        loginTextField.font = .systemFont(ofSize: FontSizes.standartTextFields.rawValue)
        loginTextField.autocapitalizationType = .none
        loginTextField.backgroundColor = .systemBackground
        loginTextField.placeholder = "Логин"
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.font = .systemFont(ofSize: FontSizes.standartTextFields.rawValue)
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

        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.isUserInteractionEnabled = true
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.setTitleColor(.systemBackground, for: .normal)
        registrationButton.setTitleColor(.systemRed, for: .highlighted)
        registrationButton.addTarget(self,
                                     action: #selector(presentRegistrationVC(_ :)),
                                     for: .touchUpInside)
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
