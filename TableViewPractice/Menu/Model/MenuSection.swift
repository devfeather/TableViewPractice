//
//  MenuSection.swift
//  TableViewPractice
//
//  Created by Feather on 07/10/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

struct MenuSection: Codable {
    enum CodingKeys: String, CodingKey {
        case title = "menu"
        case items
    }
    
    let title: String
    let items: [Menu]
}
