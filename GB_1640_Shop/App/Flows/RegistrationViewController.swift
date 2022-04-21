//
//  RegistrationViewController.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 13.04.2022.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var biographyLabel: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var biographyTextField: UITextField!
    
    @IBOutlet weak var registrationButton: UIButton!
    
    private let viewModel = RegistrationViewModel()
    private let keyboardHelper = KeyboardHelper()
    
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
        setupLablesView()
        setupTextFieldsView()
        setupButtonsView()
    }
    
    private func setupLablesView() {
        registerLabel.translatesAutoresizingMaskIntoConstraints = false
        registerLabel.text = "Регистрация"
        registerLabel.font = .systemFont(ofSize: FontSizes.bigLabel.rawValue, weight: .bold)
        registerLabel.textColor = .white
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.text = "Логин"
        loginLabel.font = .systemFont(ofSize: FontSizes.standartLabel.rawValue, weight: .bold)
        loginLabel.textColor = .systemBlue
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Пароль"
        passwordLabel.font = .systemFont(ofSize: FontSizes.standartLabel.rawValue, weight: .bold)
        passwordLabel.textColor = .systemBlue
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Имя"
        nameLabel.font = .systemFont(ofSize: FontSizes.standartLabel.rawValue, weight: .bold)
        nameLabel.textColor = .systemBlue
        
        lastnameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastnameLabel.text = "Фамилия"
        lastnameLabel.font = .systemFont(ofSize: FontSizes.standartLabel.rawValue, weight: .bold)
        lastnameLabel.textColor = .systemBlue
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "E-Mail"
        emailLabel.font = .systemFont(ofSize: FontSizes.standartLabel.rawValue, weight: .bold)
        emailLabel.textColor = .systemBlue
        
        biographyLabel.translatesAutoresizingMaskIntoConstraints = false
        biographyLabel.text = "Биография"
        biographyLabel.font = .systemFont(ofSize: FontSizes.standartLabel.rawValue, weight: .bold)
        biographyLabel.textColor = .systemBlue
    }
    
    private func setupTextFieldsView() {
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.autocapitalizationType = .none
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.autocapitalizationType = .words
        nameTextField.isSecureTextEntry = false
        
        lastnameTextField.translatesAutoresizingMaskIntoConstraints = false
        lastnameTextField.autocapitalizationType = .words
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.autocapitalizationType = .none
        
        biographyTextField.translatesAutoresizingMaskIntoConstraints = false
        biographyTextField.autocapitalizationType = .sentences
    }
    
    private func setupButtonsView() {
        registrationButton.isUserInteractionEnabled = true
        registrationButton.setTitle("Зарегистрироваться", for: .normal)
        registrationButton.setTitleColor(.systemRed, for: .highlighted)
        registrationButton.addTarget(self,
                                     action: #selector(presentUserDataVC(_ :)),
                                     for: .touchUpInside)
    }
    
    @objc func presentUserDataVC(_ sender: UIButton) {
        viewModel.sendRegistrationRequest(login: loginTextField.text ?? "",
                                          password: passwordTextField.text ?? "",
                                          email: emailTextField.text ?? "",
                                          biography: biographyTextField.text ?? "")
        
        let storyboard = UIStoryboard.init(name: "MainView", bundle: nil)
        
        guard let destinationController = storyboard
            .instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController
        else { return }
        
        destinationController.modalPresentationStyle = .fullScreen
        present(destinationController, animated: true, completion: nil)
    }
}
