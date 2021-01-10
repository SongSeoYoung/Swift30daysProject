//
//  ArtistImg.swift
//  Project 05 - Artistry
//
//  Created by 송서영 on 2021/01/10.
//

import UIKit

class ArtistImg: UIImageView {

    override var intrinsicContentSize: CGSize{
        if let myImage = self.image{
            let myImageWidth = myImage.size.width
            let myImageHeight = myImage.size.height
            let myViewWidth = self.frame.width
            let ratio = myViewWidth / myImageWidth
            let scaleHeight = myImageHeight * ratio
            return CGSize(width: myViewWidth, height: scaleHeight)
        }
        return CGSize(width: -1.0, height: -1.0)
    }

}
