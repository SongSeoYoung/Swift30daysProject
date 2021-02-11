//
//  ViewController.swift
//  Project 14 - QuoraDots
//
//  Created by 송서영 on 2021/02/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var dot1: UIImageView!
    @IBOutlet private weak var dot2: UIImageView!
    @IBOutlet private weak var dot3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAnimation()
    }
    
    private func setAnimation() {
        
        UIView.animateKeyframes(withDuration: 1.8,
                                delay: 0,
                                options: [.repeat],
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 1/4,
                                                       animations: {[weak self] in
                                                        self?.dot1.transform = CGAffineTransform(scaleX: 40, y: 40)
                                                        self?.dot3.transform = CGAffineTransform(scaleX: 1, y: 1)
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 1/4,
                                                       relativeDuration: 1/4,
                                                       animations: { [weak self] in
                                                        self?.dot2.transform = CGAffineTransform(scaleX: 40, y: 40)
                                                        self?.dot1.transform = CGAffineTransform(scaleX: 1, y: 1)
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 2/4,
                                                       relativeDuration: 1/4,
                                                       animations: { [weak self] in
                                                        self?.dot3.transform = CGAffineTransform(scaleX: 40, y: 40)
                                                        self?.dot2.transform = CGAffineTransform(scaleX: 1, y: 1)
                                                        
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 3/4,
                                                       relativeDuration: 1/4,
                                                       animations: { [weak self] in
                                                        self?.dot3.transform = CGAffineTransform(scaleX: 1, y: 1)
                                                       })
                                },
                                completion: nil)
    }
}

