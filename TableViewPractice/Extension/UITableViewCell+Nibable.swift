//
//  UITableViewCell+Nibable.swift
//  TableViewPractice
//
//  Created by Feather on 26/09/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

import UIKit

protocol Nibable {
    static var nib: UINib? { get }
}

extension UITableViewCell: Nibable {
    static var nib: UINib? {
        return UINib(nibName: identifier, bundle: nil)
    }
}

extension UITableViewCell {
    static var identifier: String {
        return description().components(separatedBy: ".").last ?? ""
    }
}
