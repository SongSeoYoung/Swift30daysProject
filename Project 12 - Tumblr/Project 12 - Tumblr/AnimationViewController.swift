//
//  AnimationViewController.swift
//  Project 12 - Tumblr
//
//  Created by 송서영 on 2021/02/05.
//

import UIKit

class AnimationViewController: UIViewController {
    //animator 객체생성
    let transition = animations()
    let dismissTransition = DismissAni()
    
    
    @IBOutlet var superView: UIView!
    @IBOutlet weak var linkStack: UIStackView!
    @IBOutlet weak var chatStack: UIStackView!
    @IBOutlet weak var photoStack: UIStackView!
    @IBOutlet weak var textStack: UIStackView!
    @IBOutlet weak var AudioStack: UIStackView!
    @IBOutlet weak var quoteStack: UIStackView!
    
    @IBOutlet weak var photoTrailing: NSLayoutConstraint!
    @IBOutlet weak var textLeading: NSLayoutConstraint!
    @IBOutlet weak var auidoTrailing: NSLayoutConstraint!
    @IBOutlet weak var linkTrailing: NSLayoutConstraint!
    
    @IBOutlet weak var chatLeading: NSLayoutConstraint!
    @IBOutlet weak var quoteLeading: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        transition.delegate = self
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        guard let homeVc: ViewController = self.storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController else {return}
        homeVc.transitioningDelegate = self
        print("dismiss")
    }
    
}

// MARK: - UIViewControllerTransitioningDelegate
extension AnimationViewController: UIViewControllerTransitioningDelegate {
    //언제 어떤 애니메이션으로 화면전환을 할건지에 대한 정보를 담고있음.
    // 여기 파라미터를 이용해서 정의하는데, 여기서는 일단 단일 애니메이션이여서 하나만 return  해주낟
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
      return transition
    }

    //dismiss 해주기
    //You check which view controller was dismissed and decide whether to return nil and use the default animation or to return a custom transition animator and use that instead.
    func animationController(forDismissed dismissed: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {

      return nil
    }
}

extension AnimationViewController: updateConstantUI {
    
    func updateUI() {
        print("update ui")
        self.textLeading.constant = 45
        self.photoTrailing.constant = 45
        UIView.animate(withDuration: 1.0, delay: 0.2, options: [.curveEaseInOut], animations: {[weak self] in
            self?.loadViewIfNeeded()
        }, completion: {_ in
            print("completed!!!!!!!")
        })
    }
    
    
}
