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
    
    var generalStackView = UIStackView()
    var experienceStackView = UIStackView()
    var referenceStackView = UIStackView()
    
    let generalButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GENERAL", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.backgroundColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleGeneralButton), for: .touchUpInside)
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
    
    let workHeader: UILabel = {
        let l = UILabel()
        l.text = "    WORK EXPERIENCE"
        l.font = UIFont.systemFont(ofSize: 16)
        l.textColor = UIColor.darkGray
        l.backgroundColor = UIColor.lightGray
        l.textAlignment = .left
        return l
    }()
    
    let skillsHeader: UILabel = {
        let l = UILabel()
        l.text = "    SKILLS"
        l.font = UIFont.systemFont(ofSize: 16)
        l.textColor = UIColor.darkGray
        l.backgroundColor = UIColor.lightGray
        l.textAlignment = .left
        return l
    }()
    
    let referenceHeader: UILabel = {
        let l = UILabel()
        l.text = "    REFERENCE"
        l.font = UIFont.systemFont(ofSize: 16)
        l.textColor = UIColor.darkGray
        l.backgroundColor = UIColor.lightGray
        l.textAlignment = .left
        return l
    }()
    
    let extraHeader: UILabel = {
        let l = UILabel()
        l.text = "    EXTRACURRICULARS"
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
        button.addTarget(self, action: #selector(handleExperienceButton), for: .touchUpInside)
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
    
    // Experience Tab Content
    let companyValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left
        return l
    }()
    
    let jobTitleValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left
        return l
    }()
    
    let employmentDateValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .right
        l.layer.borderColor = UIColor.black.cgColor
        l.layer.borderWidth = 0.1
        return l
    }()

    let skillValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left
        return l
    }()
    
    let levelValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .right
        return l
    }()
    
    let projectValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .right
        return l
    }()
    
    let extraText:  UILabel = {
        let l = UILabel()
        l.text = "   None Listed"
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left
        return l
    }()
    
    let extraValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .right

        return l
    }()
    
    // Reference page content
    let nameValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left

        return l
    }()
    
    let positionValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .right

        return l
    }()
    
    let aNameValue: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = UIColor.darkGray
        l.textAlignment = .left

        return l
    }()
    
    let aPositionValue: UILabel = {
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
        button.addTarget(self, action: #selector(handleReferenceButton), for: .touchUpInside)
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

        ref.child("user").child(userID!).child("experience").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let company = value?["Company"] as? String ?? ""
            let position = value?["Position"] as? String ?? ""
            let dates = value?["Employment Dates"] as? String ?? ""
            let skill = value?["Skill"] as? String ?? ""
            let level = value?["Experience Level"] as? String ?? ""
            let project = value?["Project Link"] as? String ?? ""
            let extracurricular = value?["Extracurricular"] as? String ?? ""
            
            self.companyValue.text = company
            self.jobTitleValue.text =  "   " + company + " - " + position
            self.employmentDateValue.text = dates
            self.skillValue.text = "   " + skill
            self.levelValue.text = level
            self.projectValue.text = project
            self.extraValue.text = extracurricular
            
            
            }) { (error) in
                print(error.localizedDescription)
        }
        
        ref.child("user").child(userID!).child("reference").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let pName = value?["Reference"] as? String ?? ""
            let pTitle = value?["Title"] as? String ?? ""
            let pCompany = value?["Company"] as? String ?? ""
            // let pRelationship = value?["Relationship"] as? String ?? ""
            // let pContact = value?["Contact"] as? String ?? ""
            let aName = value?["Alt Reference"] as? String ?? ""
            let aTitle = value?["Alt Title"] as? String ?? ""
            let aCompany = value?["Alt Company"] as? String ?? ""
            // let aRelationship = value?["Alt Relationship"] as? String ?? ""
            // let aContact = value?["Alt Contact"] as? String ?? ""
            
            self.positionValue.text = pCompany + " - " + pTitle
            self.nameValue.text = "   " + pName
            self.aPositionValue.text = aCompany + " - " + aTitle
            self.aNameValue.text = "   " + aName
            
            
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
        emailStack.distribution = .fillProportionally
        emailStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let phoneStack = UIStackView(arrangedSubviews: [phoneText, phoneValue])
        phoneStack.axis = .horizontal
        phoneStack.distribution = .fillProportionally
        phoneStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let psStack = UIStackView(arrangedSubviews: [primarySchoolText, primarySchoolValue])
        psStack.axis = .horizontal
        psStack.distribution = .fillProportionally
        psStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let pdStack = UIStackView(arrangedSubviews: [primaryDegreeText, primaryDegreeValue])
        pdStack.axis = .horizontal
        pdStack.distribution = .fillProportionally
        pdStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let pgStack = UIStackView(arrangedSubviews: [primaryGPAText, primaryGPAValue])
        pgStack.axis = .horizontal
        pgStack.distribution = .fillProportionally
        pgStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let ssStack = UIStackView(arrangedSubviews: [secondarySchoolText, secondarySchoolValue])
        ssStack.axis = .horizontal
        ssStack.distribution = .fillProportionally
        ssStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let sdStack = UIStackView(arrangedSubviews: [secondaryDegreeText, secondaryDegreeValue])
        sdStack.axis = .horizontal
        sdStack.distribution = .fillProportionally
        sdStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let sgStack = UIStackView(arrangedSubviews: [secondaryGPAText, secondaryGPAValue])
        sgStack.axis = .horizontal
        sgStack.distribution = .fillProportionally
        sgStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        generalStackView = UIStackView(arrangedSubviews: [generalHeader, emailStack, phoneStack, primaryEducationHeader, psStack, pdStack, pgStack, secondaryEducationHeader, ssStack, sdStack, sgStack])
        
        generalStackView.axis = .vertical
        generalStackView.spacing = 5
        
        view.addSubview(generalStackView)
        generalStackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 225, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        let workStack = UIStackView(arrangedSubviews: [jobTitleValue, employmentDateValue])
        workStack.axis = .horizontal
        workStack.distribution = .fillProportionally
        workStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let skillStack = UIStackView(arrangedSubviews: [skillValue, levelValue])
        skillStack.axis = .horizontal
        skillStack.distribution = .fillProportionally
        skillStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let extraStack = UIStackView(arrangedSubviews: [extraText, extraValue])
        extraStack.axis = .horizontal
        extraStack.distribution = .fillProportionally
        extraStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        experienceStackView = UIStackView(arrangedSubviews: [workHeader, workStack, skillsHeader, skillStack, extraHeader, extraStack])
        
        experienceStackView.axis = .vertical
        experienceStackView.spacing = 5
        
        view.addSubview(experienceStackView)
        experienceStackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 225, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        experienceStackView.isHidden = true
        
        let pReferenceStack = UIStackView(arrangedSubviews: [nameValue, positionValue])
        pReferenceStack.axis = .horizontal
        pReferenceStack.distribution = .fillProportionally
        pReferenceStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        let aReferenceStack = UIStackView(arrangedSubviews: [aNameValue, aPositionValue])
        aReferenceStack.axis = .horizontal
        aReferenceStack.distribution = .fillProportionally
        aReferenceStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        referenceStackView = UIStackView(arrangedSubviews: [referenceHeader, pReferenceStack, aReferenceStack])
        
        referenceStackView.axis = .vertical
        referenceStackView.spacing = 5
        
        view.addSubview(referenceStackView)
        referenceStackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 225, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        referenceStackView.isHidden = true
        
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
        generalStackView.isHidden = false
        experienceStackView.isHidden = true
        referenceStackView.isHidden = true
        
        generalButton.layer.borderColor = UIColor.lightGray.cgColor
        generalButton.layer.backgroundColor = UIColor.darkGray.cgColor
        generalButton.setTitleColor(.white, for: .normal)
        
        experienceButton.layer.borderColor = UIColor.lightGray.cgColor
        experienceButton.layer.backgroundColor = UIColor.white.cgColor
        experienceButton.setTitleColor(.darkGray, for: .normal)
        
        referenceButton.layer.borderColor = UIColor.lightGray.cgColor
        referenceButton.layer.backgroundColor = UIColor.white.cgColor
        referenceButton.setTitleColor(.darkGray, for: .normal)
    }
    
    @objc func handleExperienceButton() {
        generalStackView.isHidden = true
        experienceStackView.isHidden = false
        referenceStackView.isHidden = true
        
        generalButton.layer.borderColor = UIColor.lightGray.cgColor
        generalButton.layer.backgroundColor = UIColor.white.cgColor
        generalButton.setTitleColor(.darkGray, for: .normal)
        
        experienceButton.layer.borderColor = UIColor.lightGray.cgColor
        experienceButton.layer.backgroundColor = UIColor.darkGray.cgColor
        experienceButton.setTitleColor(.white, for: .normal)
        
        referenceButton.layer.borderColor = UIColor.lightGray.cgColor
        referenceButton.layer.backgroundColor = UIColor.white.cgColor
        referenceButton.setTitleColor(.darkGray, for: .normal)
    }

    @objc func handleReferenceButton() {
        generalStackView.isHidden = true
        experienceStackView.isHidden = true
        referenceStackView.isHidden = false
        
        generalButton.layer.borderColor = UIColor.lightGray.cgColor
        generalButton.layer.backgroundColor = UIColor.white.cgColor
        generalButton.setTitleColor(.darkGray, for: .normal)
        
        experienceButton.layer.borderColor = UIColor.lightGray.cgColor
        experienceButton.layer.backgroundColor = UIColor.white.cgColor
        experienceButton.setTitleColor(.darkGray, for: .normal)
        
        referenceButton.layer.borderColor = UIColor.lightGray.cgColor
        referenceButton.layer.backgroundColor = UIColor.darkGray.cgColor
        referenceButton.setTitleColor(.white, for: .normal)
    }



}
