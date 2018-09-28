//
//  TableKindTableViewCell.swift
//  TableViewPractice
//
//  Created by Feather on 26/09/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

import UIKit

class TableKindTableViewCell: UITableViewCell {
    static let height: CGFloat = 110
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sectionTypeLabel: UILabel!
    @IBOutlet weak var itemTypeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(kind: TableKind) {
        titleLabel.text = kind.title
        sectionTypeLabel.text = kind.sectionType.text
        itemTypeLabel.text = kind.itemType.text
    }
    
}

extension TableKindTableViewCell: NibLoadable { }
