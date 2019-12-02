//
//  User.swift
//  employD
//
//  Created by Grant Levy on 12/1/19.
//  Copyright © 2019 Grant Levy. All rights reserved.
//

class User {
    
    // Assign attributes
    var name: String!
    var phoneNumber: String!
    var profileImageURL: String!
    var uid: String!
    
    init (uid: String, dictionary: Dictionary<String, AnyObject>) {
        
        self.uid = uid
        
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        
        if let phoneNumber = dictionary["phoneNumber"] as? String {
            self.phoneNumber = phoneNumber
        }
        
        if let profileImageURL = dictionary["profileImageURL"] as? String {
            self.profileImageURL = profileImageURL
        }
    }
}
