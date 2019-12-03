//
//  UserProfileVC.swift
//  employD
//
//  Created by Grant Levy on 11/30/19.
//  Copyright © 2019 Grant Levy. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "Cell"
private let headerIdentifier = "UserProfileHeader"

class UserReferenceVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    // MARK: - Properties
    var user: User?
    
    let generalButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GENERAL", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.addTarget(self, action: #selector(handleGeneralButton), for: .touchUpInside)
        button.setTitleColor(.darkGray, for: .normal)
        return button
    }()
    
    let experienceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("EXPERIENCE", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handleExperienceButton), for: .touchUpInside)
        return button
    }()
    
    let referenceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("REFERENCES", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.backgroundColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.register(UserProfileHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)

        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "EmployD_logo"))
        
        // Set background color
        self.collectionView?.backgroundColor = .white

        // Fetch user data
        fetchCurrentUserData()
        
        configureLogoutButton()
        configureViewComponents()
    }

    func configureViewComponents() {
         let stackView = UIStackView(arrangedSubviews: [generalButton, experienceButton, referenceButton])
         
         stackView.axis = .horizontal
         stackView.distribution = .fillEqually
         stackView.spacing = 15
         
        view.addSubview(stackView)
         // addSubview(topDividerView)
         // addSubview(bottomDividerView)
         
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 170, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 30)
     }
    
    

    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        // Declare header
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! UserProfileHeader
        
        // Set the user in header
        let currentUID = Auth.auth().currentUser?.uid
        
        Database.database().reference().child("user").child(currentUID!).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? Dictionary<String, AnyObject> else { return }
            let uid = snapshot.key
            let user = User(uid: uid, dictionary: dictionary)
            // self.navigationItem.title = user.name
            header.user = user
        }
        
        // Return header
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    func configureLogoutButton() {
        var image = #imageLiteral(resourceName: "logout_thicc")
        image = image.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleLogout))
    
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
    }
    
    @objc func handleLogout() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // Add alert action
        alertController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (_) in
            do {
                // Attempt sign out
                try Auth.auth().signOut()
                
                // Present login controller
                let loginVC = LoginVC()
                let navController = UINavigationController(rootViewController: loginVC)
                self.present(navController, animated: true, completion: nil)
                
            } catch {
                // Handle error
                print("Failed to sign out")
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
            
        
    }
    
    // MARK: - API
    
    func fetchCurrentUserData() {
        
        // guard let currentUID = Auth.auth().currentUser?.uid else { return }
        
    }
    
    @objc func handleGeneralButton() {
        let newViewController = UserProfileVC()
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc func handleExperienceButton() {
        let newViewController = UserExperienceVC()
        navigationController?.pushViewController(newViewController, animated: true)
    }



}
