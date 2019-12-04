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

class UserProfileVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let generalButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GENERAL", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.backgroundColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let generalHeader: UILabel = {
        let l = UILabel()
        l.text = "    CONTACT INFORMATION"
        l.font = UIFont.systemFont(ofSize: 16)
        l.textColor = UIColor.darkGray
        l.backgroundColor = UIColor.lightGray
        l.textAlignment = .left
        return l
    }()
    
    let primaryEducationHeader: UILabel = {
        let l = UILabel()
        l.text = "    PRIMARY EDUCATION"
        l.font = UIFont.systemFont(ofSize: 16)
        l.textColor = UIColor.darkGray
        l.backgroundColor = UIColor.lightGray
        l.textAlignment = .left
        return l
    }()
    
    let secondaryEducationHeader: UILabel = {
        let l = UILabel()
        l.text = "    SECONDARY EDUCATION"
        l.font = UIFont.systemFont(ofSize: 16)
        l.textColor = UIColor.darkGray
        l.backgroundColor = UIColor.lightGray
        l.textAlignment = .left
        return l
    }()
    
    let emailText:  UILabel = {
        let l = UILabel()
        l.text = "   Email"
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left
        return l
        }()
    
    let emailValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .right
        return l
    }()
    
    let phoneText:  UILabel = {
        let l = UILabel()
        l.text = "   Phone"
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left
        return l
        }()
    
    let phoneValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .right
        return l
    }()
    
    let experienceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("EXPERIENCE", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(.darkGray, for: .normal)
        // button.addTarget(self, action: #selector(handleExperienceButton), for: .touchUpInside)
        return button
    }()
    
    let experienceText: UILabel = {
            let l = UILabel()
            l.text = """
            This is experience content
            Hello!
            """
            l.font = UIFont.systemFont(ofSize: 20)
            l.textColor = UIColor.black
            l.textAlignment = .left
            return l
        }()
    
    let primarySchoolText:  UILabel = {
        let l = UILabel()
        l.text = "   School"
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left
        return l
        }()
    
    let primarySchoolValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .right
        return l
    }()
    
    let primaryDegreeText:  UILabel = {
        let l = UILabel()
        l.text = "   Degree"
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left
        return l
        }()
    
    let primaryDegreeValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .right
        return l
    }()
    
    let primaryGPAText:  UILabel = {
        let l = UILabel()
        l.text = "   GPA"
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left
        return l
        }()
    
    let primaryGPAValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .right
        l.layer.borderColor = UIColor.black.cgColor
        l.layer.borderWidth = 0.1
        return l
    }()
    
    let secondarySchoolText:  UILabel = {
        let l = UILabel()
        l.text = "   School"
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left
        return l
        }()
    
    let secondarySchoolValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .right
        return l
    }()
    
    let secondaryDegreeText:  UILabel = {
        let l = UILabel()
        l.text = "   Degree"
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left
        return l
        }()
    
    let secondaryDegreeValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .right
        return l
    }()
    
    let secondaryGPAText:  UILabel = {
        let l = UILabel()
        l.text = "   GPA"
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left
        return l
        }()
    
    let secondaryGPAValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .right
        return l
    }()
    
    let referenceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("REFERENCES", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(.darkGray, for: .normal)
        // button.addTarget(self, action: #selector(handleReferenceButton), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var ref: DatabaseReference!

        ref = Database.database().reference()
        
        let userID = Auth.auth().currentUser?.uid
        let userEmail = Auth.auth().currentUser?.email
        emailValue.text = userEmail
        ref.child("user").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let name = value?["name"] as? String ?? ""
            let phoneNumber = value?["phoneNumber"] as? String ?? ""
            self.phoneValue.text = phoneNumber
            }) { (error) in
                print(error.localizedDescription)
        }
        
        ref.child("user").child(userID!).child("education").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let primaryDegree = value?["primaryDegree"] as? String ?? ""
            let primaryGPA = value?["primaryGPA"] as? String ?? ""
            let primarySchool = value?["primarySchool"] as? String ?? ""
            let secondaryGPA = value?["secondaryGPA"] as? String ?? ""
            let secondaryDegree = value?["secondaryDegree"] as? String ?? ""
            let secondarySchool = value?["secondarySchool"] as? String ?? ""
            
            self.primarySchoolValue.text = primarySchool
            self.primaryDegreeValue.text = primaryDegree
            self.primaryGPAValue.text = primaryGPA
            self.secondarySchoolValue.text = secondarySchool
            self.secondaryDegreeValue.text = secondaryDegree
            self.secondaryGPAValue.text = secondaryGPA
            
            
            }) { (error) in
                print(error.localizedDescription)
        }

        
 

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
        configureGeneralView()


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
    
    func configureGeneralView() {
        
        let emailStack = UIStackView(arrangedSubviews: [emailText, emailValue])
        emailStack.axis = .horizontal
        emailStack.distribution = .fillEqually
        emailStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let phoneStack = UIStackView(arrangedSubviews: [phoneText, phoneValue])
        phoneStack.axis = .horizontal
        phoneStack.distribution = .fillEqually
        phoneStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let psStack = UIStackView(arrangedSubviews: [primarySchoolText, primarySchoolValue])
        psStack.axis = .horizontal
        psStack.distribution = .fillEqually
        psStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let pdStack = UIStackView(arrangedSubviews: [primaryDegreeText, primaryDegreeValue])
        pdStack.axis = .horizontal
        pdStack.distribution = .fillEqually
        pdStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let pgStack = UIStackView(arrangedSubviews: [primaryGPAText, primaryGPAValue])
        pgStack.axis = .horizontal
        pgStack.distribution = .fillEqually
        pgStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let ssStack = UIStackView(arrangedSubviews: [secondarySchoolText, secondarySchoolValue])
        ssStack.axis = .horizontal
        ssStack.distribution = .fillEqually
        ssStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let sdStack = UIStackView(arrangedSubviews: [secondaryDegreeText, secondaryDegreeValue])
        sdStack.axis = .horizontal
        sdStack.distribution = .fillEqually
        sdStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let sgStack = UIStackView(arrangedSubviews: [secondaryGPAText, secondaryGPAValue])
        sgStack.axis = .horizontal
        sgStack.distribution = .fillEqually
        sgStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let stackView = UIStackView(arrangedSubviews: [generalHeader, emailStack, phoneStack, primaryEducationHeader, psStack, pdStack, pgStack, secondaryEducationHeader, ssStack, sdStack, sgStack])
        
        stackView.axis = .vertical
        stackView.spacing = 5
        
        view.addSubview(stackView)
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 225, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
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
    
//    @objc func handleExperienceButton() {
//        generalText.isHidden = true
//        experienceText.isHidden = false
//    }
//
//    @objc func handleReferenceButton() {
//        let newViewController = UserReferenceVC()
//        navigationController?.pushViewController(newViewController, animated: true)
//    }



}
