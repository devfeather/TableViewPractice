//
//  MainItem.swift
//  TableViewPractice
//
//  Created by Feather on 25/09/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

struct TableKind {
    enum SectionType {
        case single, multiple
        var text: String {
            switch self {
            case .single: return "Single"
            case .multiple: return "Multiple"
            }
        }
    }
    
    enum ItemType {
        case same, other
        var text: String {
            switch self {
            case .same: return "Same"
            case .other: return "Other"
            }
        }
    }
    
    let title: String
    let sectionType: SectionType
    let itemType: ItemType
}
