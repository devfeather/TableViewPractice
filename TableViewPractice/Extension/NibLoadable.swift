//
//  NibLoadable.swift
//  TableViewPractice
//
//  Created by feather on 2018. 9. 27..
//  Copyright © 2018년 Feather. All rights reserved.
//

import UIKit

protocol NibLoadable: class {
    static var nibName: String { get }
}

extension NibLoadable where Self: UIView {
    static var nibName: String { return String(describing: self) }
}
