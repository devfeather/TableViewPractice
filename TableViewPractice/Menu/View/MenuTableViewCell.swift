//
//  MenuTableViewCell.swift
//  TableViewPractice
//
//  Created by Feather on 06/10/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    static let height: CGFloat = 60
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(menu: Menu) {
        titleLabel.text = menu.title
        priceLabel.text = "\(menu.price)"
    }
}

extension MenuTableViewCell: NibLoadable { }
