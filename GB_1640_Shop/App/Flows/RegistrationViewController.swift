//
//  RegistrationViewController.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 13.04.2022.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var registerLabel: StandartLabel!
    @IBOutlet weak var loginLabel: StandartLabel!
    @IBOutlet weak var passwordLabel: StandartLabel!
    @IBOutlet weak var nameLabel: StandartLabel!
    @IBOutlet weak var lastnameLabel: StandartLabel!
    @IBOutlet weak var emailLabel: StandartLabel!
    @IBOutlet weak var biographyLabel: StandartLabel!
    
    @IBOutlet weak var passwordTextField: StandartTextField!
    @IBOutlet weak var loginTextField: StandartTextField!
    @IBOutlet weak var nameTextField: StandartTextField!
    @IBOutlet weak var lastnameTextField: StandartTextField!
    @IBOutlet weak var emailTextField: StandartTextField!
    @IBOutlet weak var biographyTextField: StandartTextField!
    
    @IBOutlet weak var registrationButton: UIButton!
    
//    private lazy var user = User()
    
    private lazy var viewModel = RegistrationViewModel()
    private lazy var keyboardHelper = KeyboardHelper()
    
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
        setupLablesView()
        setupTextFieldsView()
        setupButtonsView()
    }
    
    private func setupLablesView() {
        registerLabel.text = "Регистрация"
        
        loginLabel.text = "Логин"
        
        passwordLabel.text = "Пароль"
        
        nameLabel.text = "Имя"
        
        lastnameLabel.text = "Фамилия"
        
        emailLabel.text = "E-Mail"
        
        biographyLabel.text = "Биография"
    }
    
    private func setupTextFieldsView() {
        
        passwordTextField.isSecureTextEntry = true
        passwordTextField.accessibilityIdentifier = "passwordTF"
        
        nameTextField.autocapitalizationType = .words
        nameTextField.accessibilityIdentifier = "nameTF"
        
        lastnameTextField.autocapitalizationType = .words
        lastnameTextField.accessibilityIdentifier = "lastnameTF"
        
        biographyTextField.autocapitalizationType = .sentences
        biographyTextField.accessibilityIdentifier = "bioTF"
        
        loginTextField.accessibilityIdentifier = "loginTF"
        
        emailTextField.accessibilityIdentifier = "emailTF"
    }
    
    private func setupButtonsView() {
        registrationButton.setTitle("Зарегистрироваться", for: .normal)
        registrationButton.addTarget(self,
                                     action: #selector(presentUserDataVC(_ :)),
                                     for: .touchUpInside)
        registrationButton.accessibilityIdentifier = "regButton"
        
    }
    
    @objc func presentUserDataVC(_ sender: UIButton) {
        
        let user = User(login: loginTextField.text ?? "",
                        password: passwordTextField.text ?? "",
                        name: nameTextField.text ?? "",
                        lastname: lastnameTextField.text ?? "",
                        biography: biographyTextField.text ?? "",
                        email: emailTextField.text ?? "")
        
        viewModel.sendRegistrationRequest(user: user)
        
        let storyboard = UIStoryboard.init(name: "MainView", bundle: nil)
        
        guard let destinationController = storyboard
            .instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController
        else { return }
        
        Crashlytics.setLog(log: .registration)
        
        destinationController.modalPresentationStyle = .fullScreen
        present(destinationController, animated: true, completion: nil)
    }
}
