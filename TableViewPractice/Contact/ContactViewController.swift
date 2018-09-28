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
        requestContactList()
    }
    
    private func registerCell() {
        tableView.register(ContactTableViewCell.self)
    }
    
    private func requestContactList() {
        NetworkManager.shared.requestContactList(delay: .now() + 1) { [weak self] data in
            guard let self = self else { return }
            guard let data = data else { return }
            guard let response = try? JSONDecoder().decode([Contact].self, from: data) else { return }
            self.dataSource = response
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
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
