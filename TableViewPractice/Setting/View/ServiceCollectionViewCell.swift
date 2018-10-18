//
//  ServiceCollectionViewCell.swift
//  TableViewPractice
//
//  Created by Feather on 16/10/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var serviceImageView: UIImageView! {
        didSet {
            serviceImageView.layer.cornerRadius = serviceImageView.bounds.height / 2.0
            serviceImageView.layer.masksToBounds = true
            serviceImageView.backgroundColor = .black
        }
    }
    @IBOutlet weak var serviceNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(service: Service) {
        serviceImageView.image = UIImage(named: service.imageName)
        serviceNameLabel.text = service.name
    }
}

extension ServiceCollectionViewCell: NibLoadable { }
