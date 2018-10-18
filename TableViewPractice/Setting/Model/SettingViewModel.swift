//
//  SettingModel.swift
//  TableViewPractice
//
//  Created by Feather on 16/10/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

struct SettingViewModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case profile
        case services
        case cards
    }
    var sections: [SettingViewModelItem] = []
    
    init() { }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let profile = try? container.decode(Profile.self, forKey: .profile) {
            sections.append(ProfileViewModelItem(profile: profile))
        }
        
        if let services = try? container.decode([Service].self, forKey: .services) {
            sections.append(ServiceViewModelItem(services: services))
        }
        
        if let cards = try? container.decode([Card].self, forKey: .cards) {
            sections.append(CardViewModelItem(cards: cards))
        }
    }
}

struct ProfileViewModelItem: SettingViewModelItem {
    let profile: Profile
    var type: SettingType { return .profile }
}

struct ServiceViewModelItem: SettingViewModelItem {
    let services: [Service]
    var type: SettingType { return .service }
}

struct CardViewModelItem: SettingViewModelItem {
    let cards: [Card]
    var type: SettingType { return .card }
}
