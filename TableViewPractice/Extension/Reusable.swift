//
//  Reusable.swift
//  TableViewPractice
//
//  Created by feather on 2018. 9. 27..
//  Copyright © 2018년 Feather. All rights reserved.
//

import UIKit

protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable where Self: UIView {
    static var reuseIdentifier: String { return String(describing: self) }
}
