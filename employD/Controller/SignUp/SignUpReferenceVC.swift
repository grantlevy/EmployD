//
//  SignUpVC.swift
//  employD
//
//  Created by Grant Levy on 11/30/19.
//  Copyright © 2019 Grant Levy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpReferenceVC: UIViewController, UIImagePickerControllerDelegate {

    let pageText: UILabel = {
        let l = UILabel()
        l.text = "References"
        l.font = UIFont.boldSystemFont(ofSize: 22)
        l.textAlignment = .center
        return l
    }()
    
    // School Text Box
    let referenceTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Reference Name"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        return tf
    }()
    
    // Degree Text Box
    let contactTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Contact Information"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        return tf
    }()
    
    let companyField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Company"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        return tf
    }()
    
    let titleField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Title"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        return tf
    }()
    
    // GPA Text Box
    let relationshipTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Relationship"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        return tf
    }()
    
    // School Text Box
    let aReferenceTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Reference Name"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        return tf
    }()
    
    // Degree Text Box
    let aContactTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Contact Information"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        return tf
    }()
    
    let dummyField: UILabel = {
        let l = UILabel()
        l.text = " "
        l.font = UIFont.boldSystemFont(ofSize: 22)
        l.textAlignment = .center
        return l
    }()
    
    let aCompanyField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Company"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        return tf
    }()
    
    let aTitleField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Title"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        return tf
    }()
    
    // GPA Text Box
    let aRelationshipTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Relationship"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        return tf
    }()
    
    let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Complete", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.appCyan // (red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        button.isEnabled = true
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
    
    let primaryField: UILabel = {
        let l = UILabel()
        l.text = "Primary"
        l.font = UIFont.boldSystemFont(ofSize: 14)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left
        return l
    }()
    
    let secondaryField: UILabel = {
        let l = UILabel()
        l.text = "Alternative"
        l.font = UIFont.boldSystemFont(ofSize: 14)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left
        return l
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background color
        view.backgroundColor = .white
        
        let logo = UIImageView(image: #imageLiteral(resourceName: "logo_dark"))
        logo.contentMode = .scaleAspectFit
        view.addSubview(logo)
        logo.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 0, height: 40)
        
//        view.addSubview(progressBar)
//        progressBar.anchor(top: addPhotoText.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
        
        view.addSubview(pageText)
        pageText.anchor(top: logo.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 70, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        pageText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        configureViewComponents()
        view.addSubview(returnButton)
        returnButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 0, height: 50)
        
    }
 
    @objc func handleShowLogin() {
        let loginViewController = LoginVC()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @objc func handleSignUp() {
        
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        // Properties
        guard let primaryReference = referenceTextField.text else { return }
        guard let primaryContact = contactTextField.text else { return }
        guard let primaryRelationship = relationshipTextField.text else { return }
        guard let primaryCompany = companyField.text else { return }
        guard let primaryTitle = titleField.text else { return }
        guard let secondaryReference = aReferenceTextField.text else { return }
        guard let secondaryContact = aContactTextField.text else { return }
        guard let secondaryRelationship = aRelationshipTextField.text else { return }
        guard let secondaryCompany = aCompanyField.text else { return }
        guard let secondaryTitle = aTitleField.text else { return }
        
    
        // guard let uid = authResult?.user.uid else { return }
        
        let dictionaryValues = ["Reference": primaryReference,
                                "Contact": primaryContact,
                                "Company" : primaryCompany,
                                "Title" : primaryTitle,
                                "Relationship": primaryRelationship,
                                "Alt Reference": secondaryReference,
                                "Alt Contact": secondaryContact,
                                "Alt Company" : secondaryCompany,
                                "Alt Title" : secondaryTitle,
                                "Alt Relationship": secondaryRelationship,]
    
        let values = ["reference": dictionaryValues]
        
        // Save user info to database
        Database.database().reference().child("user").child(uid).updateChildValues(values) { (error, ref) in
        print("Success!!!!!!")
            
        }
        let loginViewController = LoginVC()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    
    func configureViewComponents() {
        
        let primaryView = UIStackView(arrangedSubviews: [primaryField, referenceTextField, contactTextField, companyField, titleField, relationshipTextField])
        primaryView.axis = .vertical
        primaryView.spacing = 10
        primaryView.distribution = .fillProportionally
        
        let secondaryView = UIStackView(arrangedSubviews: [secondaryField, aReferenceTextField, aContactTextField, aCompanyField, aTitleField, aRelationshipTextField])
        secondaryView.axis = .vertical
        secondaryView.spacing = 10
        secondaryView.distribution = .fillProportionally
        
        let stackView = UIStackView(arrangedSubviews: [primaryView, secondaryView, continueButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
        
        view.addSubview(stackView)
        stackView.anchor(top: pageText.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 0)
    }
    
}
