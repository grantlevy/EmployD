//
//  ExpandableJobListingVC.swift
//  employD
//
//  Created by Grant Levy on 12/2/19.
//  Copyright © 2019 Grant Levy. All rights reserved.
//

import UIKit

/* struct cellData {

    var opened = Bool()
    var title = String()
    var sectionData = [String]()
} */

class MicrosoftListingVC: UITableViewController {

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
        
        let headerImage = UIImageView(image: #imageLiteral(resourceName: "microsoft_listing"))
        headerImage.contentMode = UIViewContentMode.scaleAspectFit
        headerImage.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)


        
        let footerImage = UIStackView(arrangedSubviews: [rejectButton, saveButton, likeButton])
        footerImage.axis = .horizontal
        footerImage.alignment = .center
        footerImage.distribution = .fillEqually
        
        

        tableView.tableHeaderView = headerImage

        tableView.tableFooterView = footerView
        
        tableViewData = [cellData(opened: true, title: "JOB OVERVIEW" , sectionData: ["""
                A new technology paradigm is emerging, one with an intelligent cloud and an intelligent edge. To foster Microsoft’s leadership in this field, Microsoft has launched a ground-breaking program to develop the next generation of leaders in AI. Located at the Microsoft New England Research and Development Center (NERD), the Microsoft AI Development Acceleration Program (MAIDAP) is hiring soon-to-be and recent graduates from BS, MS, and PhD programs in Machine Learning or Data Science related fields. Over the course of two years, participants will work in interdisciplinary project teams to provide AI as a service to engineering teams across the globe.
                """]),
                         cellData(opened: false, title: "REQUIREMENTS", sectionData: ["""
                        Who You Are:

                         Currently pursuing a degree or graduated within the last 12 months with a degree in the following fields: Electrical Engineering, Computer Science, Data Science, Statistics, or other related fields.
                         Prefer MS (or BS with 2+ years’ experience)
                         Energized by creating AI solutions that can positively impact the work and lives of millions of people.
                         Strong passion for data-driven learning.
                         Excited by the prospect of working on a wide variety of datasets and AI applications, across many products and engineering teams.
                         Believe that data science is a team sport.
                        """]),
                         cellData(opened: false, title: "SALARY & BENEFITS", sectionData: ["""
                        Salary:                $78k - $147k

                        Vacation Days:        3 weeks

                        401k Match:        50% up to 6%

                        Other:
                        Health insurance, flexible work hours, catered lunch, 6 months maternity/paternity leave, unlimited sick days.
                        """, " "]),
                         cellData(opened: false, title: "COMPANY REVIEWS", sectionData: ["""
                            Thoughts After 10 Years…
                            Pros
                            1. If you love tech, this is a great place. No doubt you'll talk tech (mostly the MSFT stack) from enterprise to consumer - from PCs to phones to Xboxes - from datacenter to desktop.
                            2. What were GREAT benefits are now VERY GOOD (took a small step down) but still probably better than you'll find at 99% of large corporations. If you've got family - the value of the benefits is even higher. 401k match is great.
                            
                            Cons
                            Company is so large, it can be difficult to find ownership of projects.
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
        confirmAlert(title: "Confirm application?", message: "Microsoft - MAIDAP Data Scientist", nextViewController: SpotifyListingVC())
    }
    
    @objc func handleSaveButton() {
        confirmAlert(title: "Save for later?", message: "Microsoft - MAIDAP Data Scientist", nextViewController: SpotifyListingVC())
    }
    
    @objc func handleRejectButton() {
        confirmAlert(title: "Confirm rejection?", message: "Microsoft - MAIDAP Data Scientist", nextViewController: SpotifyListingVC())
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
