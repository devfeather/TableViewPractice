//
//  SettingViewController.swift
//  TableViewPractice
//
//  Created by Feather on 07/10/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var settingViewModel: SettingViewModel = SettingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        requestSettingList()
    }
    
    private func registerCell() {
        tableView.register(ProfileTableViewCell.self)
        tableView.register(ServiceTableViewCell.self)
        tableView.register(CardTableViewCell.self)
    }
    
    private func requestSettingList() {
        NetworkManager.shared.requestSettingList(delay: .now() + 0) { [weak self] data in
            guard let self = self else { return }
            guard let data = data else { return }
            guard let response = try? JSONDecoder().decode(SettingViewModel.self, from: data) else { return }
            self.settingViewModel = response
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension SettingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingViewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingViewModel.sections[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModelItem = settingViewModel.sections[indexPath.section]
        
        switch viewModelItem.type {
        case .profile:
            let cell: ProfileTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            let profile = (viewModelItem as! ProfileViewModelItem).profile
            cell.setup(profile: profile)
            return cell
            
        case .service:
            let cell: ServiceTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            let services = (viewModelItem as! ServiceViewModelItem).services
            cell.setup(services: services)
            return cell
        case .card:
            let cell: CardTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            let cards = (viewModelItem as! CardViewModelItem).cards
            cell.setup(cards: cards)
            return cell
        }
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewModelItem = settingViewModel.sections[indexPath.section]
        
        switch viewModelItem.type {
        case .profile: return ProfileTableViewCell.height
        case .service:
            let serviceCount = (viewModelItem as! ServiceViewModelItem).services.count
            let line = CGFloat((serviceCount / 4) + (serviceCount % 4 != 0 ? 1 : 0))
            return ServiceTableViewCell.height * line
        case .card:
            return 200
        }
    }
}

