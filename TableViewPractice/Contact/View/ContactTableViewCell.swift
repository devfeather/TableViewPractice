//
//  ContactTableViewCell.swift
//  TableViewPractice
//
//  Created by feather on 2018. 9. 28..
//  Copyright © 2018년 Feather. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    static let height: CGFloat = 100
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(contact: Contact) {
        profileImageView.image = UIImage(named: contact.profileImageName)
        nameLabel.text = contact.name
        phoneNumberLabel.text = contact.phoneNumber
    }
}

extension ContactTableViewCell: NibLoadable { }
