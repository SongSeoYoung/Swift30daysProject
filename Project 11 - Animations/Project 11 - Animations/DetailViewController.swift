//
//  DetailViewController.swift
//  Project 11 - Animations
//
//  Created by 송서영 on 2021/02/03.
//

import UIKit

class DetailViewController: UIViewController {

    var rowTitle: String?
    var number: Int?
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var redView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = self.rowTitle
    }
}
