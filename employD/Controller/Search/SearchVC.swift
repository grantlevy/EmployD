//
//  SearchVC.swift
//  employD
//
//  Created by Grant Levy on 12/2/19.
//  Copyright © 2019 Grant Levy. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    let searchText: UILabel = {
            let l = UILabel()
            l.text = ""
            l.font = UIFont.systemFont(ofSize: 20)
            l.textColor = UIColor.black
            l.textAlignment = .center
            l.numberOfLines = 2
            return l
        }()
        
        let jobSearchField: UITextField = {
            let tf = UITextField()
            tf.placeholder = "Job Title or Keyword"
            tf.backgroundColor = UIColor(white: 1, alpha: 0.8)
            tf.borderStyle = .roundedRect
            tf.font = UIFont.systemFont(ofSize: 16)
            tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
            tf.layer.shadowColor = UIColor.black.cgColor
            tf.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            tf.layer.shadowOpacity = 0.4
            tf.layer.shadowRadius = 2.0
            return tf
        }()
        
        let locationSearchField: UITextField = {
            let tf = UITextField()
            tf.placeholder = "Location (Optional)"
            tf.backgroundColor = UIColor(white: 1, alpha: 0.8)
            tf.borderStyle = .roundedRect
            tf.font = UIFont.systemFont(ofSize: 16)
            tf.layer.shadowColor = UIColor.black.cgColor
            tf.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            tf.layer.shadowOpacity = 0.4
            tf.layer.shadowRadius = 2.0
            return tf
        }()
        
        let searchButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Search", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = UIColor.lightGray // (red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
            button.layer.cornerRadius = 16
            button.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
            button.isEnabled = false
            return button
        }()
        
        let filterButton: UIButton = {
            let button = UIButton(type: .system)
            button.setImage(#imageLiteral(resourceName: "filter_unselected").withRenderingMode(.alwaysOriginal), for: .normal)
            // button.addTarget(self, action: #selector(handleSearchFilter), for: .touchUpInside)
            return button
        }()
        
        let dummyButton: UIButton = {
            let button = UIButton(type: .system)
            button.setImage(#imageLiteral(resourceName: "filter_white").withRenderingMode(.alwaysOriginal), for: .normal)
            return button
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()

            view.backgroundColor = .white
            
            self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "EmployD_logo"))

            configureViewComponents()
            
        }

    func configureViewComponents() {
        let stackHorizView = UIStackView(arrangedSubviews: [dummyButton, searchButton, filterButton])
        stackHorizView.axis = .horizontal
        stackHorizView.spacing = 10
        stackHorizView.distribution = .fillEqually
        stackHorizView.alignment = .center
        
        
        let stackVertView = UIStackView(arrangedSubviews: [searchText, jobSearchField, locationSearchField, stackHorizView])
        stackVertView.axis = .vertical
        stackVertView.spacing = 20
        stackVertView.distribution = .fillProportionally
        
        view.addSubview(stackVertView)
        stackVertView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 200)
    }
    
    @objc func formValidation() {
        
        guard
            jobSearchField.hasText else {
                searchButton.isEnabled = false
                searchButton.backgroundColor = UIColor.lightGray
                return
        }
        
        searchButton.isEnabled = true
        searchButton.backgroundColor = UIColor.appCyan
    }
    
    @objc func handleSearchButton() {
        let jobListingViewController = ExpandableJobListingVC()
        self.navigationController?.pushViewController(jobListingViewController, animated: true)
    }
    
        // MARK: - Table view data source
//
//        override func numberOfSections(in tableView: UITableView) -> Int {
//            // #warning Incomplete implementation, return the number of sections
//            return 0
//        }
//
//        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            // #warning Incomplete implementation, return the number of rows
//            return 0
//        }



//    }

}
