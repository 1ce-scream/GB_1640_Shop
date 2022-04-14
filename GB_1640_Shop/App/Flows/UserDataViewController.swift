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
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var editInfoButton: UIButton!
    @IBOutlet weak var emailTextView: UITextView!
    @IBOutlet weak var genderTextView: UITextView!
    @IBOutlet weak var saveEditedDataButton: UIButton!
    
    @IBAction func editUserData(_ sender: Any) {
        toggleEditInfo()
    }
    
    @IBAction func saveEditedData(_ sender: Any) {
        toggleEditInfo()
        viewModel.sendChageUserDataRequest(email: emailTextView.text ?? "")
    }
    
    private let viewModel = UserDataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

    }
    
    private func setupViews() {
        view.backgroundColor = .systemBlue
        userAvatarImageView.image = UIImage(named: "KyleBroflovski")
        setupLabelsView()
        setupUserBioTextView()
        setupTextViews()
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
        
        genderLabel.text = "Gender:"
        genderLabel.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private func setupTextViews() {
        emailTextView.translatesAutoresizingMaskIntoConstraints = false
        emailTextView.text = "some@some.com"
        emailTextView.font = .systemFont(ofSize: 20, weight: .regular)
        emailTextView.isEditable = false
        emailTextView.isScrollEnabled = false
        emailTextView.isSelectable = true
        emailTextView.keyboardType = .emailAddress
        emailTextView.dataDetectorTypes = .link
        
        genderTextView.translatesAutoresizingMaskIntoConstraints = false
        genderTextView.text = "Male"
        genderTextView.font = .systemFont(ofSize: 20, weight: .regular)
        genderTextView.isEditable = false
        genderTextView.isScrollEnabled = false
        genderTextView.isSelectable = true
    }
    
    private func setupUserBioTextView() {
        userBioTextView.translatesAutoresizingMaskIntoConstraints = false
        userBioTextView.text = "Biography Biography Biography Biography Biography Biography Biography Biography Biography Biography Biography Biography Biography Biography Biography Biography Biography "
        userBioTextView.textAlignment = .center
        userBioTextView.textColor = .black
        userBioTextView.isUserInteractionEnabled = true
        userBioTextView.font = .italicSystemFont(ofSize: 14)
        userBioTextView.isEditable = false
        userBioTextView.isScrollEnabled = true
        userBioTextView.isSelectable = true
    }
    
    private func toggleEditInfo() {
        emailTextView.isEditable.toggle()
        genderTextView.isEditable.toggle()
        userBioTextView.isEditable.toggle()
        
        editInfoButton.isHidden.toggle()
        saveEditedDataButton.isHidden.toggle()
    }
    
}
