//
//  ExpandableJobListingVC.swift
//  employD
//
//  Created by Grant Levy on 12/2/19.
//  Copyright © 2019 Grant Levy. All rights reserved.
//

import UIKit

struct cellData {

    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class SpotifyListingVC: UITableViewController {

    var tableViewData = [cellData]()
    
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
    
    let likeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "like_button"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleLikeButton), for: .touchUpInside)
        return button
    }()
    
    let rejectButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "reject_button"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleRejectButton), for: .touchUpInside)
        return button
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "save_button"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleSaveButton), for: .touchUpInside)
        return button
    }()
    
    let footerView: UIView = {
        let fv = UIView()
        return fv
    }()
    
    let footerBorder: UIView = {
            let v = UIView()
            v.layer.borderColor = UIColor.black.cgColor
            v.layer.borderWidth = 0.3
            v.layer.backgroundColor = UIColor.white.cgColor
            return v
    }()
    
//    let rejectButton = UIButton(type: .custom)
//    likeButton.setImage(#imageLiteral(resourceName: "reject_button"), for: .normal)
//    likeButton.addTarget(self, action: #selector(handleLikeButton), for: .touchUpInside)
//
//    let saveButton = UIButton(type: .custom)
//    likeButton.setImage(#imageLiteral(resourceName: "save_button"), for: .normal)
//    likeButton.addTarget(self, action: #selector(handleLikeButton), for: .touchUpInside)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "EmployD_logo"))
        self.navigationItem.title = ""
        
        let headerImage = UIImageView(image: #imageLiteral(resourceName: "spotify_v1"))
        headerImage.contentMode = UIViewContentMode.scaleAspectFit
        headerImage.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)


        
        let footerImage = UIStackView(arrangedSubviews: [rejectButton, saveButton, likeButton])
        footerImage.axis = .horizontal
        footerImage.alignment = .center
        footerImage.distribution = .fillEqually

        tableView.tableHeaderView = headerImage
        tableView.tableFooterView = footerView
        
        tableViewData = [cellData(opened: true, title: "JOB OVERVIEW" , sectionData: ["""
                We are looking for Machine Learning Engineers to #JoinTheBand and help drive a data-driven culture across Spotify. You will work on a variety of problems such as content recommendation, personalization, optimization, user intelligence, and content classification. Collaborative efforts with your team will result in new and interesting hypotheses, tests and scaling to large data sets with hundreds of billions of data points. Above all, your work will impact the way the world experiences music.
                """]),
                         cellData(opened: false, title: "REQUIREMENTS", sectionData: ["""
                        Who You Are:

                         Currently enrolled in a Ph.D. or Master’s graduate program in Machine Learning, or related field preferred
                         You have experience implementing machine learning systems at scale in Java, Scala, Python or similar (not just R or Matlab)
                         You have a strong mathematical background in statistics and machine learning
                         You care about agile software processes, data-driven development, reliability, and responsible experimentation
                        """]),
                         cellData(opened: false, title: "SALARY & BENEFITS", sectionData: ["""
                        Salary:                $108K - $150K

                         Vacation Days:        4 weeks

                         401k Match:        50% up to 6%

                         Other:
                         Health insurance, flexible work hours, catered lunch, 6 months maternity/paternity leave, unlimited sick days.
                        """, " "]),
                         cellData(opened: false, title: "COMPANY REVIEWS", sectionData: ["""
                            Amazing Culture and Trust
                            Pros
                            - Very smart and friendly coworkers
                            - Safe work environment (in engineering at least)
                            - A lot of trust is given to the employees to do their jobs correctly and to do what's right for the company
                            - The most inclusive workplace I've ever seen
                            Cons
                            - Some growing organisational pains. The "Spotify model" is good but is reaching it's capacity.
                            """, " ", " "] )]
        
        setupTableView()
//        tableView.addSubview(footerImage)
        // likeButton.anchor(top: footerView.topAnchor, left: view.leftAnchor, bottom: footerView.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 100)
        configureViewComponents()

        
    }

    func configureViewComponents() {
        
        let stackView = UIStackView(arrangedSubviews: [rejectButton, saveButton, likeButton])
         
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
         
        view.addSubview(footerBorder)
        view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        footerBorder.anchor(top: stackView.topAnchor, left: view.leftAnchor, bottom: stackView.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
        stackView.anchor(top: nil, left: footerView.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 45, paddingBottom: 10, paddingRight: 45, width: 0, height: 80)
        
     }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return tableViewData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
            cell.textLabel?.text = tableViewData[indexPath.section].title
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            cell.backgroundColor = .lightGray
            cell.textLabel?.textColor = .darkGray
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)

            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            cell.backgroundColor = .white
            cell.textLabel?.textColor = .black
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true {
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                
                
            } else {
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                
            }
        }
    }
    
    func setupTableView() {
        tableView.separatorColor = UIColor.darkGray
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    @objc func handleLikeButton() {
        confirmAlert(title: "Confirm application?", message: "Spotify - Machine Learning Engineer", nextViewController: MicrosoftListingVC())
    }
    
    @objc func handleSaveButton() {
        confirmAlert(title: "Save for later?", message: "Spotify - Machine Learning Engineer", nextViewController: MicrosoftListingVC())
    }
    
    @objc func handleRejectButton() {
        confirmAlert(title: "Confirm rejection?", message: "Spotify - Machine Learning Engineer", nextViewController: MicrosoftListingVC())
    }
    
    func confirmAlert (title:String, message:String, nextViewController: UITableViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Return", style: UIAlertActionStyle.cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
