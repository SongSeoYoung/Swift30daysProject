//
//  InterestCollectionViewCell.swift
//  Project 10 - Interests
//
//  Created by 송서영 on 2021/01/26.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    //MARK:- public API
    var interest: Interest! {
        didSet{
            updateUI()
        }
    }
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    
    private func updateUI() {
        interestTitleLabel.text = interest.title
        featuredImageView.image = interest.featuredImage
    }
}
