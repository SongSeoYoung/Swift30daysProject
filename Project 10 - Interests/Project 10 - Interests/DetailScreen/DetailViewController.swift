//
//  DetailViewController.swift
//  Project 10 - Interests
//
//  Created by 송서영 on 2021/01/26.
//

import UIKit

class DetailViewController: UIViewController {

    var indexNumber: Int?
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var detailTextLabel: UILabel!
    //dummy data 가져오기
    private var interest = Interest.createInterests()
    override func viewDidLoad() {
        super.viewDidLoad()
        makeDetailUI()
    }
    
    func makeDetailUI() {
        guard let indexN = indexNumber else {return}
        self.detailImg.image = interest[indexN].featuredImage
        self.detailTextLabel.text = interest[indexN].description
    }

}
