//
//  MenuViewController.swift
//  TableViewPractice
//
//  Created by Feather on 06/10/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var dataSource: [MenuSection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "스따벅스"
        registerCell()
        requestMenuList()
    }
    
    private func registerCell() {
        tableView.register(MenuTableViewCell.self)
    }
    
    private func requestMenuList() {
        NetworkManager.shared.requestMenuList(delay: .now() + 0) { [weak self] data in
            guard let self = self else { return }
            guard let data = data else { return }
            guard let response = try? JSONDecoder().decode([MenuSection].self, from: data) else { return }
            self.dataSource = response
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension MenuViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard dataSource.count > section else { return 0 }
        return dataSource[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let menuSection = dataSource[indexPath.section]
        let menu = menuSection.items[indexPath.row]
        cell.setup(menu: menu)
        return cell
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .white
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = dataSource[section].title
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        header.addSubview(label)
        
        label.topAnchor.constraint(equalTo: header.topAnchor, constant: 35).isActive = true
        label.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 15).isActive = true
        
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MenuTableViewCell.height
    }
}
