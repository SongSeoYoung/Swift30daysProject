//
//  AnimationViewController.swift
//  Project 12 - Tumblr
//
//  Created by 송서영 on 2021/02/05.
//

import UIKit

class AnimationViewController: UIViewController {

    @IBOutlet var superView: UIView!
    @IBOutlet weak var linkStack: UIStackView!
    @IBOutlet weak var chatStack: UIStackView!
    @IBOutlet weak var photoStack: UIStackView!
    @IBOutlet weak var textStack: UIStackView!
    @IBOutlet weak var AudioStack: UIStackView!
    @IBOutlet weak var quoteStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        print("dismiss")
    }
    
}

extension AnimationViewController: UIViewControllerTransitioningDelegate {
    
}
