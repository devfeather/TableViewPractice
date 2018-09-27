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
        tableView.register(BasicTableViewCell.self)
    }
}

extension SingleSectionSameItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BasicTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.titleLabel.text = "Hello"
        return cell
    }
}

extension SingleSectionSameItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
