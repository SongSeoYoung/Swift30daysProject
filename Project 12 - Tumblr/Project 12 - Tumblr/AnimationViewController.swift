//
//  AnimationViewController.swift
//  Project 12 - Tumblr
//
//  Created by 송서영 on 2021/02/05.
//

import UIKit

class AnimationViewController: UIViewController {
    //animator 객체생성
    private let transition = animations()
    
    @IBOutlet weak var photoTrailing: NSLayoutConstraint!
    @IBOutlet weak var textLeading: NSLayoutConstraint!
    @IBOutlet weak var auidoTrailing: NSLayoutConstraint!
    @IBOutlet weak var linkTrailing: NSLayoutConstraint!
    @IBOutlet weak var chatLeading: NSLayoutConstraint!
    @IBOutlet weak var quoteLeading: NSLayoutConstraint!
    
    
    //MARK: - dismiss
    @IBAction private func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("dismiss")
    }
    
}

