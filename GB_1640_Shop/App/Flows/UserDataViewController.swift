//
//  UserDataViewController.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 13.04.2022.
//

import UIKit

class UserDataViewController: UIViewController {

    @IBOutlet weak var userAvatarImageView: AvatarImage!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userBioTextView: UITextView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var userGenderLabel: UILabel!
    @IBOutlet weak var editInfoButton: UIButton!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userGenderTextField: UITextField!
    @IBOutlet weak var saveEditedDataButton: UIButton!
    
    @IBAction func editUserData(_ sender: Any) {
        userEmailLabel.isHidden = true
        userEmailTextField.isHidden = false
        userEmailLabel.text = userEmailLabel.text
        
        userGenderLabel.isHidden = true
        userGenderTextField.isHidden = false
        userGenderLabel.text = userEmailLabel.text
        
        editInfoButton.isHidden = true
        saveEditedDataButton.isHidden = false
    }
    
    @IBAction func saveEditedData(_ sender: Any) {
        userEmailTextField.isHidden = true
        userEmailLabel.isHidden = false
        userEmailLabel.text = userEmailTextField.text
        
        userGenderLabel.isHidden = false
        userGenderTextField.isHidden = true
        userGenderLabel.text = userEmailLabel.text
        
        editInfoButton.isHidden = false
        saveEditedDataButton.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
//        setupEmailLabelAction()
        // Do any additional setup after loading the view.
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBlue
        userAvatarImageView.image = UIImage(named: "KyleBroflovski")
        setupLabelsView()
        setupUserBioTextView()
        setupTextFieldsView()
        setupButtonsView()
    }
    
    private func setupButtonsView() {
        editInfoButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        editInfoButton.setTitle("Редактировать", for: .normal)
        
        saveEditedDataButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        saveEditedDataButton.setTitle("Сохранить", for: .normal)
        saveEditedDataButton.isHidden = true
    }
    
    private func setupLabelsView() {
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.text = "Firstname Lastname"
        userNameLabel.textColor = .systemBlue
        userNameLabel.font = .systemFont(ofSize: 25, weight: .bold)
        
        emailLabel.text = "E-mail:"
        emailLabel.font = .systemFont(ofSize: 20, weight: .bold)
        userEmailLabel.text = "some@some.com"
        userEmailLabel.font = .systemFont(ofSize: 20, weight: .regular)
        
        genderLabel.text = "Gender:"
        genderLabel.font = .systemFont(ofSize: 20, weight: .bold)
        userGenderLabel.text = "Male"
        userGenderLabel.font = .systemFont(ofSize: 20, weight: .regular)
    }
    
    private func setupTextFieldsView() {
        userEmailTextField.isHidden = true
        userGenderTextField.isHidden = true
    }
    
    private func setupUserBioTextView() {
        userBioTextView.translatesAutoresizingMaskIntoConstraints = false
        userBioTextView.text = "Biography Biography Biography Biography Biography Biography Biography Biography Biography Biography Biography Biography Biography Biography Biography Biography Biography "
        userBioTextView.textAlignment = .center
        userBioTextView.textColor = .black
        userBioTextView.isUserInteractionEnabled = true
        userBioTextView.font = .italicSystemFont(ofSize: 14)
        userBioTextView.isEditable = true
        userBioTextView.isScrollEnabled = true
        userBioTextView.isSelectable = true
        
    }
    
}
