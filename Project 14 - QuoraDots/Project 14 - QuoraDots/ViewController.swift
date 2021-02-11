//
//  ViewController.swift
//  Project 14 - QuoraDots
//
//  Created by 송서영 on 2021/02/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dot1: UIImageView!
    @IBOutlet weak var dot2: UIImageView!
    @IBOutlet weak var dot3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setAnimation()
    }

    func setAnimation() {
        
//        UIView.animate(withDuration: 1,
//                       delay: 0,
////                       options: .none,
//                       animations: {[weak self] in
//                        self?.dot1.transform = CGAffineTransform(scaleX: 4, y: 4)
//                       },
//                       completion: {[weak self]_ in
//                        UIView.animate(withDuration: 1,
//                                       delay: 0,
////                                       options: .none,
//                                       animations: {[weak self] in
//                                        self?.dot2.transform = CGAffineTransform(scaleX: 4, y: 4)
//                                        self?.dot1.transform = CGAffineTransform(translationX: 1, y: 1)
//                                       },
//                                       completion: { [weak self]_ in
//                                        UIView.animateKeyframes(withDuration: 1,
//                                                                delay: 0,
////                                                                options: ,
//                                                                animations: {[weak self] in
//                                                                    self?.dot3.transform = CGAffineTransform(scaleX: 4, y: 4)
//                                                                    self?.dot2.transform = CGAffineTransform(translationX: 1, y: 1)
//                                                                },
//                                                                completion: nil)
//                                       })})

        UIView.animateKeyframes(withDuration: 3, delay: 0, options: [.repeat], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3, animations: {[weak self] in
                self?.dot1.transform = CGAffineTransform(scaleX: 4, y: 4)
                self?.dot3.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3, animations: { [weak self] in
                self?.dot2.transform = CGAffineTransform(scaleX: 4, y: 4)
                self?.dot1.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3, animations: { [weak self] in
                self?.dot3.transform = CGAffineTransform(scaleX: 4, y: 4)
                self?.dot2.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
            
//            UIView.animate(withDuration: 2/6, delay: 0, options: [.autoreverse], animations: {[weak self] in
//                self?.dot1.transform = CGAffineTransform(scaleX: 2, y: 2)
//            }, completion: nil)
//            UIView.animate(withDuration: 2/6, delay: 2/6, options: [.autoreverse], animations: {[weak self] in
//                self?.dot2.transform = CGAffineTransform(scaleX: 2, y: 2)
//            }, completion: nil)
//            UIView.animate(withDuration: 2/6, delay: 4/6, options: [.autoreverse], animations: {[weak self] in
//                self?.dot3.transform = CGAffineTransform(scaleX: 2, y: 2)
//            }, completion: nil)
            
        }, completion: nil)
    }
}

