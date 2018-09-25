//
//  MainViewController.swift
//  TableViewPractice
//
//  Created by Feather on 25/09/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let cellID = "MainCell"
    private var dataSource: [MainItem] = [MainItem(sectionKind: .single, itemKind: .same),
                                          MainItem(sectionKind: .single, itemKind: .other),
                                          MainItem(sectionKind: .multiple, itemKind: .same),
                                          MainItem(sectionKind: .multiple, itemKind: .other)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let item = dataSource[indexPath.row]
        cell.textLabel?.text = "\(item.sectionKind.text) of \(item.itemKind.text)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

