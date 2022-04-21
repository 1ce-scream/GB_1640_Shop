//
//  RegistrationViewController.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 13.04.2022.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var testScrollView: UIScrollView!
    @IBOutlet weak var registerLabel: StandartLabel!
    @IBOutlet weak var loginLabel: StandartLabel!
    @IBOutlet weak var passwordLabel: StandartLabel!
    @IBOutlet weak var nameLabel: StandartLabel!
    @IBOutlet weak var lastnameLabel: StandartLabel!
    @IBOutlet weak var emailLabel: StandartLabel!
    @IBOutlet weak var biographyLabel: StandartLabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var biographyTextField: UITextField!
    
    @IBOutlet weak var registrationButton: UIButton!
    
    private lazy var viewModel = RegistrationViewModel()
    private lazy var keyboardHelper = KeyboardHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        keyboardHelper.scrollView = testScrollView
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
        registerLabel.text = "Регистрация"
        registerLabel.textColor = .white
        
        loginLabel.text = "Логин"
        
        passwordLabel.text = "Пароль"
        
        nameLabel.text = "Имя"
        
        lastnameLabel.text = "Фамилия"
        
        emailLabel.text = "E-Mail"
        
        biographyLabel.text = "Биография"
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
