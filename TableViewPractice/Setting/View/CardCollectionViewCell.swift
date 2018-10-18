//
//  CardCollectionViewCell.swift
//  TableViewPractice
//
//  Created by Feather on 18/10/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cardFrameView: UIView! {
        didSet {
            cardFrameView.layer.cornerRadius = 10
            cardFrameView.layer.masksToBounds = true
            cardFrameView.layer.borderWidth = 0.5
            cardFrameView.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var cardNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(card: Card) {
        cardNameLabel.text = card.name
        cardFrameView.backgroundColor = UIColor(hexString: "#" + card.colorHex)
    }
}

extension CardCollectionViewCell: NibLoadable { }
