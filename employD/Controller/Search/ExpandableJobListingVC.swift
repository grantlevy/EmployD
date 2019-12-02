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
    // var title = NSMutableAttributedString()
    // var sectionData = [NSMutableAttributedString]()
    var title = String()
    var sectionData = [String]()
}

class ExpandableJobListingVC: UITableViewController {

    var tableViewData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
           /* tableViewData = [cellData(opened: false, title: NSMutableAttributedString(string: "JOB OVERVIEW",
                 attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.black]),
                sectionData: [NSMutableAttributedString(string: "We are looking for Machine Learning Engineers to #JoinTheBand and help drive a data-driven culture across Spotify. You will work on a variety of problems such as content recommendation, personalization, optimization, user intelligence, and content classification. Collaborative efforts with your team will result in new and interesting hypotheses, tests and scaling to large data sets with hundreds of billions of data points. Above all, your work will impact the way the world experiences music.",
                    attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.black])])] */

        
        tableViewData = [cellData(opened: false, title: "JOB OVERVIEW", sectionData: ["""
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
                        """]),
                         cellData(opened: false, title: "COMPANY REVIEWS", sectionData: ["""
                            Amazing Culture and Trust
                            Pros
                            - Very smart and friendly coworkers
                            - Safe work environment (in engineering at least)
                            - A lot of trust is given to the employees to do their jobs correctly and to do what's right for the company
                            - The most inclusive workplace I've ever seen
                            Cons
                            - Some growing organisational pains. The "Spotify model" is good but is reaching it's capacity.
                            """] )]
        setupTableView()

        
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
//            cell.backgroundColor = .lightGray
//            cell.textLabel?.textColor = .darkGray
//            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            // tableView.rowHeight = 20
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true {
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                tableView.isScrollEnabled = true
                
            } else {
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                tableView.isScrollEnabled = true
            }
        }
    }
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
