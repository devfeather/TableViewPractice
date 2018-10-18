//
//  CardTableViewCell.swift
//  TableViewPractice
//
//  Created by Feather on 18/10/2018.
//  Copyright © 2018 Feather. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    private var cards: [Card] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
    }
    
    private func registerCell() {
        collectionView.register(CardCollectionViewCell.self)
    }
    
    func setup(cards: [Card]) {
        self.cards = cards
        collectionView.reloadData()
    }
}

extension CardTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CardCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setup(card: cards[indexPath.row])
        return cell
    }
}

extension CardTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets { return .zero }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { return 0 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { return 0 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = (width - 30 * 2) / 2.0
        return CGSize(width: UIScreen.main.bounds.width, height: height)
    }
}

extension CardTableViewCell: NibLoadable { }
