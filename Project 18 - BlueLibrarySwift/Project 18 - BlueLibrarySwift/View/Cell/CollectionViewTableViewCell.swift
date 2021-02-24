//
//  CollectionViewTableViewCell.swift
//  Project 18 - BlueLibrarySwift
//
//  Created by 송서영 on 2021/02/24.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
