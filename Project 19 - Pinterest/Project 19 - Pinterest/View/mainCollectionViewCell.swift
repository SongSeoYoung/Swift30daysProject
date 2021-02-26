//
//  mainCollectionViewCell.swift
//  Project 19 - Pinterest
//
//  Created by 송서영 on 2021/02/25.
//

import UIKit

class mainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var photoBackView: UIView!
    @IBOutlet weak var captionLabel: UILabel!
    
    func fittingSize() -> CGSize {
        let targetSize = CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: UIView.layoutFittingCompressedSize.height)
        return self.photoBackView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
    }
}
