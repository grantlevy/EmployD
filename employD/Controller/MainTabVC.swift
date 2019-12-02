//
//  MainTabVC.swift
//  employD
//
//  Created by Grant Levy on 11/30/19.
//  Copyright © 2019 Grant Levy. All rights reserved.
//

import UIKit
import Firebase

class MainTabVC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set delegate
        self.delegate = self
        
        // Configure view controllers
        configureViewControllers()
        
        // User validation
        checkLogInStatus()
        
    }
    
    // Function to create tab bar view controllers
    func configureViewControllers() {
        
        // Home controller
        let feedVC = constructNavController(unselectedImage: #imageLiteral(resourceName: "home_unselected") , selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: HomeVC(collectionViewLayout: UICollectionViewFlowLayout()))
        
        // Search controller
        let searchVC = constructNavController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected") , rootViewController: SearchVC())
        
        // Chat controller
        let chatVC = constructNavController(unselectedImage: #imageLiteral(resourceName: "comment") , selectedImage: #imageLiteral(resourceName: "comment"), rootViewController: ChatVC())
        
        // Profile controller
        let userProfileVC = constructNavController(unselectedImage: #imageLiteral(resourceName: "profile_unselected") , selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: UserProfileVC(collectionViewLayout: UICollectionViewFlowLayout()))
        
        // View controller to be added to tab controller
        viewControllers = [feedVC, searchVC, chatVC, userProfileVC]
        
        // Tab bar tint color
        tabBar.tintColor = .black
        tabBar.isTranslucent = false
        
    }
    
    // Function to construct navigation controllers
    func constructNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        
     
        
        // Nav controller
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        // navController.navigationBar.tintColor = .black
        navController.modalPresentationStyle = .fullScreen
        navController.navigationBar.isTranslucent = false
        navController.navigationBar.barTintColor = UIColor.darkGray
        present(navController, animated: true)
        
        // Return nav controller
        return navController
    }
    
    func checkLogInStatus() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                // Present login controller
                let loginVC = LoginVC()
                let navController = UINavigationController(rootViewController: loginVC)
                self.present(navController, animated: true, completion: nil)
                return
            }
        }
    }

}
