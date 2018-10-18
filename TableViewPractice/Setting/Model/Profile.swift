//
//  Profile.swift
//  TableViewPractice
//
//  Created by Feather on 16/10/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

struct Profile: Codable {
    enum CodingKeys: String, CodingKey {
        case profileImageName = "imageName"
        case name
        case email
    }
    
    let profileImageName: String
    let name: String
    let email: String
}
