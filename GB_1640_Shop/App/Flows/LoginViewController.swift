//
//  LoginViewController.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 12.04.2022.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var brandNameLabel: StandartLabel!
    @IBOutlet weak var loginTextField: StandartTextField!
    @IBOutlet weak var passwordTextField: StandartTextField!
    @IBOutlet weak var loginButton: StandartButton!
    @IBOutlet weak var registrationButton: SubButton!
    @IBOutlet weak var crashButton: ExitButton!
    
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
        view.backgroundColor = BackgroundsColor.standart.value
        setupLabelsView()
        setupTextFieldsView()
        setupButtonsView()
    }
    
    private func setupLabelsView() {
        brandNameLabel.text = "GBShop"
        brandNameLabel.font = .systemFont(ofSize: FontSizes.mainLabel.rawValue)
        brandNameLabel.textAlignment = .center
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
        loginButton.accessibilityIdentifier = "loginButton"
        loginButton.addTarget(self,
                              action: #selector(loginButtonTapped(_:)),
                              for: .touchUpInside)

        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.addTarget(self,
                                     action: #selector(registrationButtonTapped(_:)),
                                     for: .touchUpInside)
        registrationButton.accessibilityIdentifier = "registrationButton"
        
        crashButton.addTarget(self,
                              action: #selector(self.crashButtonTapped(_:)),
                              for: .touchUpInside)
    }
    
    @objc func loginButtonTapped(_ sender: AnyObject) {
        lazy var user = User(login: loginTextField.text ?? "",
                        password: passwordTextField.text ?? "")
        
        viewModel.sendLoginRequest(user: user) { response in
            if response == 1 {
                Crashlytics.setLog(log: .authSuccess)
                self.performSegue(withIdentifier: "loginToTabbarSegue", sender: nil)
            } else {
                Crashlytics.setLog(log: .authFail)
                self.alert.showAlert(title: "Ошибка", message: "Логин или пароль не верны")
                self.passwordTextField.text = ""
            }
        }
    }
    
    @objc func registrationButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "MainView", bundle: nil)
        guard let destinationController = storyboard
            .instantiateViewController(withIdentifier: "RegistrationVC") as? RegistrationViewController
        else { return }
        destinationController.modalPresentationStyle = .fullScreen
        present(destinationController, animated: true, completion: nil)
    }
    
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        let numbers = [0]
        _ = numbers[1]
    }
}
