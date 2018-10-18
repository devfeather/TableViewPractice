//
//  ServiceTableViewCell.swift
//  TableViewPractice
//
//  Created by Feather on 16/10/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {
    static let cellSize: CGSize = {
        var width = UIScreen.main.bounds.width / 4.0
        return CGSize(width: width, height: width)
    }()
    static var height: CGFloat { return cellSize.height }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    private var services: [Service] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
    }
    
    private func registerCell() {
        collectionView.register(ServiceCollectionViewCell.self)
    }
    
    func setup(services: [Service]) {
        self.services = services
        collectionView.reloadData()
    }
}

extension ServiceTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ServiceCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setup(service: services[indexPath.row])
        return cell
    }
}

extension ServiceTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets { return .zero }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { return 0 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { return 0 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return ServiceTableViewCell.cellSize
    }
}

extension ServiceTableViewCell: NibLoadable { }
