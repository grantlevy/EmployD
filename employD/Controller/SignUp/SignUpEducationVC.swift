//
//  SignUpVC.swift
//  employD
//
//  Created by Grant Levy on 11/30/19.
//  Copyright © 2019 Grant Levy. All rights reserved.
//

import UIKit
import Firebase

class SignUpEducationVC: UIViewController, UIImagePickerControllerDelegate {

    let pageText: UILabel = {
        let l = UILabel()
        l.text = "Education"
        l.font = UIFont.boldSystemFont(ofSize: 22)
        l.textAlignment = .center
        return l
    }()
    
//    let progressBar: UIImageView = {
//        let im = UIImageView(image: #imageLiteral(resourceName: "step1"))
//        im.contentMode = .scaleAspectFill
//        return im
//    }()
    
    // School Text Box
    let schoolTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "School Name"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        tf.autocorrectionType = .no
        return tf
    }()
    
    // Degree Text Box
    let degreeTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Degree"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        tf.autocorrectionType = .no
        return tf
    }()
    
    // GPA Text Box
    let gpaTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "GPA (Optional)"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        return tf
    }()
    
    // School Text Box
    let otherSchoolTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Alternative School Name (Optional)"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        tf.autocorrectionType = .no
        return tf
    }()
    
    // Degree Text Box
    let otherDegreeTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Alternative Degree (Optional)"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        tf.autocorrectionType = .no
        return tf
    }()
    
    let dummyField: UILabel = {
        let l = UILabel()
        l.text = " "
        l.font = UIFont.boldSystemFont(ofSize: 22)
        l.textAlignment = .center
        return l
    }()
    
    // GPA Text Box
    let otherGpaTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Alternative GPA (Optional)"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        return tf
    }()
    
    let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue   (2/4)", for: .normal)
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
        l.text = "Secondary"
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
        guard let primarySchool = schoolTextField.text else { return }
        guard let primaryDegree = degreeTextField.text else { return }
        guard let primaryGPA = gpaTextField.text else { return }
        guard let secondaryDegree = otherDegreeTextField.text else { return }
        guard let secondarySchool = otherSchoolTextField.text else { return }
        guard let secondaryGPA = otherGpaTextField.text else { return }
    
        // guard let uid = authResult?.user.uid else { return }
        
        let dictionaryValues = ["primarySchool": primarySchool,
                                "primaryDegree": primaryDegree,
                                "primaryGPA": primaryGPA,
                                "secondarySchool": secondarySchool,
                                "secondaryDegree": secondaryDegree,
                                "secondaryGPA": secondaryGPA,]
    
        let values = ["education": dictionaryValues]
        
        // Save user info to database
        Database.database().reference().child("user").child(uid).updateChildValues(values) { (error, ref) in
        print("Success!!!!!!")
        
        /* Database.database().reference().child("user").updateChildValues(values) { (error, ref) in
            print("Success!!!!!!") */
            
        }
        
        let loginViewController = SignUpExperienceVC()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }

    
    @objc func formValidation() {
        guard
            schoolTextField.hasText,
            degreeTextField.hasText
            else {
                continueButton.isEnabled = false
                continueButton.backgroundColor = UIColor.lightGray
                return
        }
        
        continueButton.isEnabled = true
        continueButton.backgroundColor = UIColor.appCyan
    }
    
    
    func configureViewComponents() {
        
        let primaryView = UIStackView(arrangedSubviews: [primaryField, schoolTextField, degreeTextField, gpaTextField])
        primaryView.axis = .vertical
        primaryView.spacing = 10
        primaryView.distribution = .fillProportionally
        
        let secondaryView = UIStackView(arrangedSubviews: [secondaryField, otherSchoolTextField, otherDegreeTextField, otherGpaTextField])
        secondaryView.axis = .vertical
        secondaryView.spacing = 10
        secondaryView.distribution = .fillProportionally
        
        let stackView = UIStackView(arrangedSubviews: [primaryView, secondaryView, continueButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
        
        view.addSubview(stackView)
        stackView.anchor(top: pageText.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 360)
    }
    
}



