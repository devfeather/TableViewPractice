//
//  SettingViewModelItem.swift
//  TableViewPractice
//
//  Created by Feather on 17/10/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

enum SettingType {
    case profile
    case service
    case card
}

protocol SettingViewModelItem {
    var type: SettingType { get }
    var rowCount: Int { get }
}

extension SettingViewModelItem {
    var rowCount: Int { return 1 }
}
