//
//  SingleSectionSameItemsViewController.swift
//  TableViewPractice
//
//  Created by Feather on 26/09/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

import UIKit

class SingleSectionSameItemsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
    private func registerCell() {
        tableView.register(BasicTableViewCell.nib, forCellReuseIdentifier: BasicTableViewCell.identifier)
    }
}

extension SingleSectionSameItemsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BasicTableViewCell.identifier, for: indexPath) as? BasicTableViewCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = "Hello"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
