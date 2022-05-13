//
//  UserDataViewController.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 13.04.2022.
//

import UIKit

class UserDataViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userAvatarImageView: AvatarImage!
    @IBOutlet weak var userNameTextView: StandartTextView!
    @IBOutlet weak var userBioTextView: SubTextView!
    @IBOutlet weak var emailLabel: StandartLabel!
    @IBOutlet weak var genderLabel: StandartLabel!
    @IBOutlet weak var editInfoButton: SubButton!
    @IBOutlet weak var emailTextView: SubTextView!
    @IBOutlet weak var genderTextView: SubTextView!
    @IBOutlet weak var saveEditedDataButton: StandartButton!
    @IBOutlet weak var creditCardLabel: StandartLabel!
    @IBOutlet weak var creditCardTextView: SubTextView!
    @IBOutlet weak var exitButton: ExitButton!
    
    @IBAction func editUserData(_ sender: Any) {
        toggleEditInfo()
    }
    
    @IBAction func saveEditedData(_ sender: Any) {
        toggleEditInfo()
        user.email = emailTextView.text ?? ""
        viewModel.sendChageUserDataRequest(user: user)
        alert.showAlert(title: "Успех", message: "Ваши данные успешно изменены!")
    }
    
    @IBAction func exitToLogin(_ sender: Any) {
        viewModel.sendLogoutRequest(user: user)
        
        let storyboard = UIStoryboard.init(name: "MainView", bundle: nil)
        guard let destinationController = storyboard
            .instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController
        else { return }
        destinationController.modalPresentationStyle = .fullScreen
        present(destinationController, animated: true, completion: nil)
    }
    
    private lazy var user = User(id: 1)
    private lazy var viewModel = UserDataViewModel()
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
        userAvatarImageView.image = UIImage(named: "KyleBroflovski")
        setupLabelsView()
        setupTextViews()
        setupButtonsView()
    }
    
    private func setupButtonsView() {
        editInfoButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        editInfoButton.setTitle("Редактировать", for: .normal)
        editInfoButton.accessibilityIdentifier = "editInfoButton"
        
        saveEditedDataButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        saveEditedDataButton.setTitle("Сохранить", for: .normal)
        saveEditedDataButton.isHidden = true
        saveEditedDataButton.accessibilityIdentifier = "saveInfoButton"
        
        exitButton.setTitle("Выход", for: .normal)
    }
    
    private func setupLabelsView() {
        emailLabel.text = "E-mail:"
        
        genderLabel.text = "Gender:"
        
        creditCardLabel.text = "Card:"
    }
    
    private func setupTextViews() {
        userNameTextView.text = "\(user.name) \(user.lastname)"
        userNameTextView.textAlignment = .center
        userNameTextView.font = .systemFont(ofSize: FontSizes.bigTextView.rawValue,
                                            weight: .bold)
        userNameTextView.accessibilityIdentifier = "userNameTV"
        
        emailTextView.text = user.email
        emailTextView.keyboardType = .emailAddress
        emailTextView.dataDetectorTypes = .link
        
        genderTextView.text = user.gender
        
        userBioTextView.text = user.biography
        userBioTextView.textAlignment = .center
        
        creditCardTextView.text = user.creditcard
    }
    
    private func toggleEditInfo() {
        emailTextView.isEditable.toggle()
        genderTextView.isEditable.toggle()
        userBioTextView.isEditable.toggle()
        userNameTextView.isEditable.toggle()
        creditCardTextView.isEditable.toggle()
        
        editInfoButton.isHidden.toggle()
        saveEditedDataButton.isHidden.toggle()
    }
}
