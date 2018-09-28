//
//  ContactViewController.swift
//  TableViewPractice
//
//  Created by Feather on 26/09/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var dataSource: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        load()
    }
    
    private func registerCell() {
        tableView.register(ContactTableViewCell.self)
    }
    
    private func load() {
        guard let dataAsset = NSDataAsset(name: "contact") else { return }
        guard let response = try? JSONDecoder().decode([Contact].self, from: dataAsset.data) else { return }
        dataSource = response
        tableView.reloadData()
    }
}

extension ContactViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let contact = dataSource[indexPath.row]
        cell.setup(contact: contact)
        return cell
    }
}

extension ContactViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ContactTableViewCell.height
    }
}
