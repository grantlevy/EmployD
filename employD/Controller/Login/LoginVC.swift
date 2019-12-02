//
//  LoginVC.swift
//  employD Application
//
//  Created by Grant Levy on 11/29/19.
//  Copyright © 2019 Grant Levy. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    // Email Text Box
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.8)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        tf.autocapitalizationType = .none
        return tf
    }()
    
    // Password Text Box
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor(white: 1, alpha: 0.8)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        tf.isSecureTextEntry = true
        return tf
    }()
    
    // Login Button
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.lightGray // (red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
            
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?   ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.appCyan]))
        
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background color
        view.backgroundColor = .white
        
        // Hide navigation bar
        navigationController?.navigationBar.isHidden = true
        
        configureViewComponents()
        view.addSubview(signUpButton)
        
        signUpButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 0, height: 50)
        
        assignbackground()
        
    }
    

    func configureViewComponents() {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        
        view.addSubview(stackView)
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 250, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 140)
    }
    
    @objc func handleShowSignUp() {
        let signUpVC = SignUpVC()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @objc func formValidation() {
        
        // Email and password must have text
        guard
            emailTextField.hasText,
            passwordTextField.hasText else {
                loginButton.isEnabled = false
                loginButton.backgroundColor = UIColor.lightGray
                return
        }
        
        // Email and password have text
        loginButton.isEnabled = true
        loginButton.backgroundColor = UIColor.appCyan
    }
    
    @objc func handleLogin() {
        
        // Properties
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text else { return }
        
        // Sign user in with email/password
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            // Handle error
            if let error = error {
                print("Unable to sign user rin with error ", error.localizedDescription)
                return
            }
            
            // Handle success
            print("Successfully signed user in")
            guard let mainTabVC = UIApplication.shared.keyWindow?.rootViewController as? MainTabVC else { return }
            
            // Configure view controllers in main tab
            mainTabVC.configureViewControllers()
        
            // Dismiss login controller
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func assignbackground(){
          let background = UIImage(named: "background")
          var imageView : UIImageView!
          imageView = UIImageView(frame: view.bounds)
          imageView.contentMode = UIViewContentMode.scaleAspectFill
          imageView.clipsToBounds = true
          imageView.image = background
          imageView.center = view.center
          view.addSubview(imageView)
          self.view.sendSubview(toBack: imageView)
      }

}
