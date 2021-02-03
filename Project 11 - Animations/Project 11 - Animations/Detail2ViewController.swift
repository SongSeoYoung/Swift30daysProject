//
//  Detail2ViewController.swift
//  Project 11 - Animations
//
//  Created by 송서영 on 2021/02/03.
//

import UIKit

class Detail2ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func TappedBtn(_ sender: Any) {
        self.img.image = UIImage(named: "whatsapp")
        self.img.alpha = 0
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: [.curveEaseInOut],
                       animations: {[weak self] in
                        self?.img.alpha = 1
                        self?.img.image = UIImage(named: "facebook")
                       },
                       completion: nil)
    }
}
