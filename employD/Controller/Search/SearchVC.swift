//
//  SearchVC.swift
//  employD
//
//  Created by Grant Levy on 12/2/19.
//  Copyright © 2019 Grant Levy. All rights reserved.
//

import UIKit



class SearchVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let salaryOptions = [" ", "$50,000", "$60,000", "$75,000", "$100,000", "$150,000"]
    let sizeOptions = [" ", "<50", "50 - 100", "100 - 500", "500 - 2000", ">2000"]
    let ratingOptions = [" ", "1+", "2+", "3+", "4+"]
    let typeOptions = [" ", "Full Time", "Part Time", "Internship", "Co-op"]
    
    let salaryPickerView = UIPickerView()
    let sizePickerView = UIPickerView()
    let ratingPickerView = UIPickerView()
    let typePickerView = UIPickerView()
    
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
        tf.autocorrectionType = .no
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
        tf.autocorrectionType = .no
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
        button.addTarget(self, action: #selector(handleSearchFilter), for: .touchUpInside)
        return button
    }()

    var filterOn = false
    
    let dummyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "filter_white").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let salaryLabel: UILabel = {
        let l = UILabel()
        l.text = " Minimum Salary"
        l.font = UIFont.systemFont(ofSize: 16)
        l.textColor = UIColor.black
        l.textAlignment = .center
        return l
    }()
    
    let salaryPicker: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Amount"
        tf.backgroundColor = UIColor.appLightGray
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let sizeLabel: UILabel = {
        let l = UILabel()
        l.text = "    Company Size"
        l.font = UIFont.systemFont(ofSize: 16)
        l.textColor = UIColor.black
        l.textAlignment = .center
        return l
    }()
    
    let sizePicker: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Employees"
        tf.backgroundColor = UIColor.appLightGray
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let ratingLabel: UILabel = {
        let l = UILabel()
        l.text = "Company Rating"
        l.font = UIFont.systemFont(ofSize: 16)
        l.textColor = UIColor.black
        l.textAlignment = .center
        return l
    }()
    
    let ratingPicker: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Stars"
        tf.backgroundColor = UIColor.appLightGray
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let typeLabel: UILabel = {
        let l = UILabel()
        l.text = "             Job Type"
        l.font = UIFont.systemFont(ofSize: 16)
        l.textColor = UIColor.black
        l.textAlignment = .center
        return l
    }()
    
    let typePicker: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Select"
        tf.backgroundColor = UIColor.appLightGray
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let filterBorder: UIView = {
        let v = UIView()
        v.layer.borderColor = UIColor.black.cgColor
        v.layer.borderWidth = 1
        v.layer.backgroundColor = UIColor.white.cgColor
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        v.layer.shadowOpacity = 0.6
        v.layer.shadowRadius = 3.0
        return v
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
    
    func configureFilters(show: Bool) {
        
        /* let label = UITextField()
        label.text = "           Advanced Search Options          "
        label.font = UIFont.systemFont(ofSize: 22)
        label.backgroundColor = UIColor.lightGray
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 2 */
        
        
        let salaryStack = UIStackView(arrangedSubviews: [salaryLabel, salaryPicker])
        salaryStack.axis = .horizontal
        salaryStack.spacing = 10
        salaryStack.alignment = .center
        salaryStack.distribution = .fillEqually
        
        let sizeStack = UIStackView(arrangedSubviews: [sizeLabel, sizePicker])
        sizeStack.axis = .horizontal
        sizeStack.spacing = 10
        sizeStack.alignment = .center
        sizeStack.distribution = .fillEqually
        
        let ratingStack = UIStackView(arrangedSubviews: [ratingLabel, ratingPicker])
        ratingStack.axis = .horizontal
        ratingStack.spacing = 10
        ratingStack.alignment = .center
        ratingStack.distribution = .fillEqually
        
        let typeStack = UIStackView(arrangedSubviews: [typeLabel, typePicker])
        typeStack.axis = .horizontal
        typeStack.spacing = 10
        typeStack.alignment = .center
        typeStack.distribution = .fillEqually
        
        let filterStack = UIStackView(arrangedSubviews: [salaryStack, sizeStack, ratingStack, typeStack])
        filterStack.axis = .vertical
        filterStack.spacing = 15
        filterStack.alignment = .center
        filterStack.distribution = .fillEqually
    
        view.addSubview(filterBorder)
        view.addSubview(filterStack)
        
        filterStack.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 340, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 200)
        
        filterBorder.anchor(top: filterStack.topAnchor, left: filterStack.leftAnchor, bottom: filterStack.bottomAnchor, right: filterStack.rightAnchor, paddingTop: -20, paddingLeft: -5, paddingBottom: -140, paddingRight: -5, width: 0, height: 360)

        salaryPickerView.delegate = self
        salaryPicker.inputView = salaryPickerView
        
        sizePickerView.delegate = self
        sizePicker.inputView = sizePickerView
        
        ratingPickerView.delegate = self
        ratingPicker.inputView = ratingPickerView
        
        typePickerView.delegate = self
        typePicker.inputView = typePickerView
        
        if show == true {
            filterStack.isHidden = false
            filterBorder.isHidden = false
        } else {
            filterStack.isHidden = true
            filterBorder.isHidden = true
        }
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
        let jobListingViewController = SpotifyListingVC()
        self.navigationController?.pushViewController(jobListingViewController, animated: true)
    }
    
    @objc func handleSearchFilter() {
        if filterOn == false {
            filterButton.setImage(#imageLiteral(resourceName: "filter_selected").withRenderingMode(.alwaysOriginal), for: .normal)
            filterOn = true
            configureFilters(show: true)
        } else {
            filterButton.setImage(#imageLiteral(resourceName: "filter_unselected").withRenderingMode(.alwaysOriginal), for: .normal)
            filterOn = false
            configureFilters(show: false)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == salaryPickerView {
            return salaryOptions.count
        } else if pickerView == sizePickerView {
            return sizeOptions.count
        } else if pickerView == ratingPickerView {
            return ratingOptions.count
        } else {
            return typeOptions.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == salaryPickerView {
            return salaryOptions[row]
        } else if pickerView == sizePickerView {
            return sizeOptions[row]
        } else if pickerView == ratingPickerView {
            return ratingOptions[row]
        } else {
            return typeOptions[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == salaryPickerView {
            salaryPicker.text = salaryOptions[row]
        } else if pickerView == sizePickerView {
            sizePicker.text = sizeOptions[row]
        } else if pickerView == ratingPickerView {
            ratingPicker.text = ratingOptions[row]
        } else {
            typePicker.text = typeOptions[row]
        }
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
