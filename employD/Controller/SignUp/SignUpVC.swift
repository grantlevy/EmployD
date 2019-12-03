//
//  SignUpVC.swift
//  employD
//
//  Created by Grant Levy on 11/30/19.
//  Copyright © 2019 Grant Levy. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageSelected = false
    
    // Add Photo Button
    let addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "addPhoto2").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        return button
    }()
    
    let addPhotoText: UILabel = {
        let l = UILabel()
        l.text = "Tap to Add Photo"
        l.font = UIFont.systemFont(ofSize: 10)
        l.textAlignment = .center
        return l
    }()
    
    let pageText: UILabel = {
        let l = UILabel()
        l.text = "General Information"
        l.font = UIFont.boldSystemFont(ofSize: 22)
        l.textAlignment = .center
        return l
    }()
    
    let accountField: UILabel = {
        let l = UILabel()
        l.text = "Account"
        l.font = UIFont.boldSystemFont(ofSize: 14)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left
        return l
    }()
    
    let contactField: UILabel = {
        let l = UILabel()
        l.text = "Contact"
        l.font = UIFont.boldSystemFont(ofSize: 14)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left
        l.numberOfLines = 2
        return l
    }()
    
    let dummyField: UILabel = {
        let l = UILabel()
        l.text = ""
        l.font = UIFont.boldSystemFont(ofSize: 18)
        return l
    }()
    
//    let progressBar: UIImageView = {
//        let im = UIImageView(image: #imageLiteral(resourceName: "step1"))
//        im.contentMode = .scaleAspectFill
//        return im
//    }()
    
    // Name Text Box
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Full Name"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        tf.autocorrectionType = .no
        return tf
    }()
    
    // Email Text Box
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocapitalizationType = .none
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        tf.autocorrectionType = .no
        return tf
    }()
    
    // Password Text Box
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.isSecureTextEntry = true
        tf.placeholder = "Password"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        tf.autocorrectionType = .no
        return tf
    }()
    
    // Phone Number Text Box
    let phoneTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Phone Number"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        tf.autocorrectionType = .no
        return tf
    }()
    
    let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue   (1/4)", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.lightGray // (red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    let returnButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?   ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.black])
        attributedTitle.append(NSAttributedString(string: "Sign In", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.appCyan]))
        
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background color
        view.backgroundColor = .white
        
        let logo = UIImageView(image: #imageLiteral(resourceName: "logo_dark"))
        logo.contentMode = .scaleAspectFit
        view.addSubview(logo)
        logo.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 0, height: 40)
        
        view.addSubview(addPhotoButton)
        addPhotoButton.anchor(top: logo.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 40, paddingBottom: 0, paddingRight: 0, width: 140, height: 140)
        addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
        view.addSubview(addPhotoText)
        addPhotoText.anchor(top: addPhotoButton.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: -8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        addPhotoText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
//        view.addSubview(progressBar)
//        progressBar.anchor(top: addPhotoText.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
        
        view.addSubview(pageText)
        pageText.anchor(top: addPhotoText.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        pageText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        configureViewComponents()
        view.addSubview(returnButton)
        returnButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 0, height: 50)
        
    }
 
    @objc func handleShowLogin() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @objc func handleSignUp() {
        
        // Properties
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let fullName = nameTextField.text else { return }
        guard let phoneNumber = phoneTextField.text else { return }
    
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            // Error handling
            if let error = error {
                print("Failed to create user with error: ", error.localizedDescription)
                return
            }
            
            // Set Profile Image
            guard let profileImg = self.addPhotoButton.imageView?.image else { return }
            
            // Upload profile image
            guard let uploadData = UIImageJPEGRepresentation(profileImg, 0.3) else { return }
            
            // Place image into Firebase
            let filename = NSUUID().uuidString
            let storageRef = Storage.storage().reference().child("profile_image").child(filename)

            storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                
                // Handle error
                if let error = error {
                    print("Failed to upload image to Firebase Storage with error ", error.localizedDescription)
                }
                
                // Profile image URL
                storageRef.downloadURL { (downloadURL, error) in
                    guard let profileImageURL = downloadURL?.absoluteString else {
                        print("Profile image URL is nil")
                        return
                    }
                
                    guard let uid = authResult?.user.uid else { return }
                    
                    let dictionaryValues = ["name": fullName,
                                            "phoneNumber": phoneNumber,
                                            "profileImageURL": profileImageURL]
                
                    let values = [uid: dictionaryValues]
                    
                    // Save user info to database
                    Database.database().reference().child("user").updateChildValues(values) { (error, ref) in
                        print("Success!!!!!!")
                    }
                }
            }
            
            // Success
            print("Successfully created user with Firebase")
            
            
            
        }
        
        let jobListingViewController = SignUpEducationVC()
        self.navigationController?.pushViewController(jobListingViewController, animated: true)
    }
    
    @objc func formValidation() {
        guard
            emailTextField.hasText,
            passwordTextField.hasText,
            nameTextField.hasText,
            phoneTextField.hasText,
            imageSelected == true else {
                continueButton.isEnabled = false
                continueButton.backgroundColor = UIColor.lightGray
                return
        }
        
        continueButton.isEnabled = true
        continueButton.backgroundColor = UIColor.appCyan
    }
    
    @objc func handleSelectPhoto() {
        // Configure Image Selection
        let imageSelector = UIImagePickerController()
        imageSelector.delegate = self
        imageSelector.allowsEditing = true
        
        // Present when pressed
        self.present(imageSelector, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let profileImage = info[UIImagePickerControllerEditedImage] as? UIImage else {
            imageSelected = false
            return
        }
    
        // Image selected to true
        imageSelected = true
        
        // Configure photo button with selected image
        addPhotoButton.layer.cornerRadius = addPhotoButton.frame.width / 2
        addPhotoButton.layer.masksToBounds = true
        addPhotoButton.layer.borderColor = UIColor.black.cgColor
        addPhotoButton.layer.borderWidth = 2
        addPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        self.dismiss(animated: true, completion: nil)
    }
    
    func configureViewComponents() {
        let accountView = UIStackView(arrangedSubviews: [accountField, nameTextField, passwordTextField])
        accountView.axis = .vertical
        accountView.spacing = 10
        accountView.distribution = .fillProportionally
        
        let contactView = UIStackView(arrangedSubviews: [contactField, emailTextField, phoneTextField])
        contactView.axis = .vertical
        contactView.spacing = 10
        contactView.distribution = .fillProportionally
        
        let stackView = UIStackView(arrangedSubviews: [accountView, contactView, continueButton])
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.distribution = .fillProportionally
        
        
        view.addSubview(stackView)
        stackView.anchor(top: addPhotoButton.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 230, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 300)
    }
    
}



