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
    @IBOutlet weak var saveEditedDataButton: SubButton!
    @IBOutlet weak var creditCardLabel: StandartLabel!
    @IBOutlet weak var creditCardTextView: SubTextView!
    
    @IBAction func editUserData(_ sender: Any) {
        toggleEditInfo()
    }
    
    @IBAction func saveEditedData(_ sender: Any) {
        toggleEditInfo()
        viewModel.sendChageUserDataRequest(email: emailTextView.text ?? "")
        alert.showAlert(title: "Успех", message: "Ваши данные успешно изменены!")
    }
    
    private lazy var viewModel = UserDataViewModel()
    private lazy var keyboardHelper = KeyboardHelper()
    private lazy var alert = AlertsHelper(viewController: self)
    private let demoUser: User = User(id: 123,
                                      login: "Somebody",
                                      password: "Password",
                                      name: "Name",
                                      lastname: "Lastname",
                                      biography: "Bio bio bio bio bio bio bio bio bio",
                                      creditcard: "1234-1234-1234",
                                      email: "some@some.com",
                                      gender: "X")
    
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
        userAvatarImageView.image = UIImage(named: "KyleBroflovski")
        setupLabelsView()
        setupTextViews()
        setupButtonsView()
    }
    
    private func setupButtonsView() {
        editInfoButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        editInfoButton.setTitle("Редактировать", for: .normal)
        
        saveEditedDataButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        saveEditedDataButton.setTitle("Сохранить", for: .normal)
        saveEditedDataButton.backgroundColor = .systemGreen
        saveEditedDataButton.isHidden = true
        
    }
    
    private func setupLabelsView() {
        emailLabel.text = "E-mail:"
        
        genderLabel.text = "Gender:"
        
        creditCardLabel.text = "Card:"
    }
    
    private func setupTextViews() {
        userNameTextView.text = "\(demoUser.name) \(demoUser.lastname)"
        userNameTextView.textAlignment = .center
        userNameTextView.font = .systemFont(ofSize: FontSizes.bigTextView.rawValue, weight: .bold)
        userNameTextView.accessibilityIdentifier = "userNameTV"
        
        emailTextView.text = demoUser.email
        emailTextView.keyboardType = .emailAddress
        emailTextView.dataDetectorTypes = .link
        
        genderTextView.text = demoUser.gender
        
        userBioTextView.text = demoUser.biography
        userBioTextView.textAlignment = .center
        
        creditCardTextView.text = demoUser.creditcard
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
