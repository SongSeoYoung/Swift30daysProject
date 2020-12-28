//
//  DetailViewController.swift
//  Project 01 - GoodAsOldPhones
//
//  Created by 송서영 on 2020/12/28.
//

import UIKit

class DetailViewController: UIViewController {

    var cellImage: Int?
    var cellTitle: String?
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var backgroundImage: UIImageView!
    private let imageData: [UIImage?] = [
        UIImage(named: "phone-fullscreen1"),
        UIImage(named: "phone-fullscreen2"),
        UIImage(named: "phone-fullscreen3"),
        UIImage(named: "phone-fullscreen4")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = cellTitle
        backgroundImage.image = imageData[cellImage ?? 0]
    }
    
    


}
