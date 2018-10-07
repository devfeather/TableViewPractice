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
    
    private var dataSource: [TableKind] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        requestTableList()
    }
    
    private func registerCell() {
        tableView.register(TableKindTableViewCell.self)
    }
    
    private func requestTableList() {
        NetworkManager.shared.requestTableList(delay: .now() + 0) { [weak self] data in
            guard let self = self else { return }
            guard let data = data else { return }
            guard let response = try? JSONDecoder().decode([TableKind].self, from: data) else { return }
            self.dataSource = response
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableKindTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let kind = dataSource[indexPath.row]
        cell.setup(kind: kind)
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableKindTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kind = dataSource[indexPath.row]
        let vc: UIViewController
        
        switch (kind.sectionType, kind.itemType) {
        case (TableKind.SectionType.single, TableKind.ItemType.same):
            let storyboard = UIStoryboard(name: "Contact", bundle: nil)
            vc = storyboard.instantiateViewController(withIdentifier: "ContactViewController")
            
        case (TableKind.SectionType.multiple, TableKind.ItemType.same):
            let storyboard = UIStoryboard(name: "Menu", bundle: nil)
            vc = storyboard.instantiateViewController(withIdentifier: "MenuViewController")
            
        case (TableKind.SectionType.multiple, TableKind.ItemType.other): return
            
        default: return
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

