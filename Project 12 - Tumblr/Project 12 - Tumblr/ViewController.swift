//
//  ViewController.swift
//  Project 12 - Tumblr
//
//  Created by 송서영 on 2021/02/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func plusTapped(_ sender: Any) {
        guard let aniVc: AnimationViewController = self.storyboard?.instantiateViewController(identifier: "AnimationViewController") as? AnimationViewController else {return}
        aniVc.modalPresentationStyle = .fullScreen
        self.present(aniVc, animated: true, completion: nil)
        
    }
    
}

