//
//  MainItem.swift
//  TableViewPractice
//
//  Created by Feather on 25/09/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

struct MainItem {
    enum SectionKind {
        case single, multiple
        var text: String {
            switch self {
            case .single: return "Single Section"
            case .multiple: return "Multiple Section"
            }
        }
    }
    
    enum ItemKind {
        case same, other
        var text: String {
            switch self {
            case .same: return "Same Items"
            case .other: return "Other Items"
            }
        }
    }
    
    let sectionKind: SectionKind
    let itemKind: ItemKind
}
