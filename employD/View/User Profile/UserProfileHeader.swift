//
//  UserProfileHeader.swift
//  employD
//
//  Created by Grant Levy on 11/30/19.
//  Copyright © 2019 Grant Levy. All rights reserved.
//

import UIKit


class UserProfileHeader: UICollectionViewCell {
    
    var user: User? {
        didSet {
            let fullName = user?.name
            nameLabel.text = fullName
            
            guard let profileImageURL = user?.profileImageURL else { return }
            profileImageView.loadImage(with: profileImageURL)
        }
    }
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    let editProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Profile", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.appCyan.withAlphaComponent(0.2)
        button.layer.borderColor = UIColor.appCyan.withAlphaComponent(0.5).cgColor
        button.layer.borderWidth = 1.5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        profileImageView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 45, paddingBottom: 0, paddingRight: 0, width: 125, height: 125)
        profileImageView.layer.cornerRadius = 125 / 2
        
        addSubview(nameLabel)
        nameLabel.anchor(top: self.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        addSubview(editProfileButton)
        editProfileButton.anchor(top: nameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 25)
        
        configureBottomToolBar()
        
    }
    
    func configureBottomToolBar() {
        let topDividerView = UIView()
        topDividerView.backgroundColor = .lightGray
        
        let bottomDividerView = UIView()
        bottomDividerView.backgroundColor = .lightGray
        
        // topDividerView.anchor(top: stackView.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
        
        // bottomDividerView.anchor(top: stackView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
