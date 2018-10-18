//
//  ProfileTableViewCell.swift
//  TableViewPractice
//
//  Created by Feather on 16/10/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    static let height: CGFloat = 100
    @IBOutlet weak var profileImageView: UIImageView! {
        didSet {
            profileImageView.layer.cornerRadius = 10
            profileImageView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    func setup(profile: Profile) {
        profileImageView.image = UIImage(named: profile.profileImageName)
        nameLabel.text = profile.name
        emailLabel.text = profile.email
    }
}

extension ProfileTableViewCell: NibLoadable { }
