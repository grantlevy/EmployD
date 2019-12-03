//
//  JobListingVC.swift
//  employD
//
//  Created by Grant Levy on 12/2/19.
//  Copyright © 2019 Grant Levy. All rights reserved.
//

import UIKit

struct ExpandablePart {
    
    var isExpanded: Bool
    let content: [String]
    
}

class JobListingVC: UITableViewController {

    let cellId = "cellId123123"
    
    let titles = [
        "JOB OVERVIEW", "REQUIREMENTS", "SALARY & BENEFITS", "COMPANY REVIEWS"
    ]
    
    var twoDimensionalArray = [
        ExpandablePart(isExpanded: true, content: ["""
    We are looking for Machine Learning Engineers to #JoinTheBand and help drive a data-driven culture across Spotify. You will work on a variety of problems such as content recommendation, personalization, optimization, user intelligence, and content classification. Collaborative efforts with your team will result in new and interesting hypotheses, tests and scaling to large data sets with hundreds of billions of data points. Above all, your work will impact the way the world experiences music.
    """]),
        ExpandablePart(isExpanded: true, content: ["""
    Who You Are:

     Currently enrolled in a Ph.D. or Master’s graduate program in Machine Learning, or related field preferred
     You have experience implementing machine learning systems at scale in Java, Scala, Python or similar (not just R or Matlab)
     You have a strong mathematical background in statistics and machine learning
     You care about agile software processes, data-driven development, reliability, and responsible experimentation
    """]),
        ExpandablePart(isExpanded: true, content: ["""
        Salary:                $108K - $150K

         Vacation Days:        4 weeks

         401k Match:        50% up to 6%

         Other:
         Health insurance, flexible work hours, catered lunch, 6 months maternity/paternity leave, unlimited sick days.
        """]),
        ExpandablePart(isExpanded: true, content: ["""
        Amazing Culture and Trust
        Pros
        - Very smart and friendly coworkers
        - Safe work environment (in engineering at least)
        - A lot of trust is given to the employees to do their jobs correctly and to do what's right for the company
        - The most inclusive workplace I've ever seen
        Cons
        - Some growing organisational pains. The "Spotify model" is good but is reaching it's capacity.
        """])
                     
    ]
    
    var showIndexPaths = false
    
    @objc func handleShowIndexPath() {
        
        print("Attemping reload animation of indexPaths...")
        
        // build all the indexPaths we want to reload
        var indexPathsToReload = [IndexPath]()
        
        for section in twoDimensionalArray.indices {
            for row in twoDimensionalArray[section].content.indices {
                print(section, row)
                let indexPath = IndexPath(row: row, section: section)
                indexPathsToReload.append(indexPath)
            }
        }
        
//        for index in twoDimensionalArray[0].indices {
//            let indexPath = IndexPath(row: index, section: 0)
//            indexPathsToReload.append(indexPath)
//        }
        
        showIndexPaths = !showIndexPaths
        
        let animationStyle = showIndexPaths ? UITableViewRowAnimation.right : .left
        
        tableView.reloadRows(at: indexPathsToReload, with: animationStyle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "EmployD_logo"))
        
        let headerImage = UIImageView(image: #imageLiteral(resourceName: "spotify_v1"))
        headerImage.contentMode = UIViewContentMode.scaleAspectFit
        headerImage.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        
        tableView.tableHeaderView = headerImage
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        
        button.tag = section
        
        return button
    }
    
    @objc func handleExpandClose(button: UIButton) {
        print("Trying to expand and close section...")
        
        let section = button.tag
        
        // we'll try to close the section first by deleting the rows
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].content.indices {
            print(0, row)
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        twoDimensionalArray[section].isExpanded = !isExpanded
        
        button.setTitle(isExpanded ? "+" : "-", for: .normal)
        
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionalArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !twoDimensionalArray[section].isExpanded {
            return 0
        }
        
        return twoDimensionalArray[section].content.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let name = twoDimensionalArray[indexPath.section].content[indexPath.row]
        
        cell.textLabel?.text = name
        
        if showIndexPaths {
            cell.textLabel?.text = "\(name)   Section:\(indexPath.section) Row:\(indexPath.row)"
        }
        
        return cell
    }

}
