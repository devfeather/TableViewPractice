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
        load()
    }
    
    private func registerCell() {
        tableView.register(TableKindTableViewCell.self)
    }
    
    private func load() {
        guard let dataAsset = NSDataAsset(name: "table_kind") else { return }
        guard let response = try? JSONDecoder().decode([TableKind].self, from: dataAsset.data) else { return }
        dataSource = response
        tableView.reloadData()
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
            let storyboard = UIStoryboard(name: "SingleSection", bundle: nil)
            vc = storyboard.instantiateViewController(withIdentifier: "SingleSectionSameItemsViewController")
            
        case (TableKind.SectionType.multiple, TableKind.ItemType.same): return
        case (TableKind.SectionType.multiple, TableKind.ItemType.other): return
            
        default: return
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

