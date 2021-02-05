//
//  ViewController.swift
//  Project 12 - Tumblr
//
//  Created by 송서영 on 2021/02/05.
//

import UIKit

class ViewController: UIViewController{
    //animator 객체생성
    private let transition = animations()
    

    @IBAction private func plusTapped(_ sender: Any) {
        guard let aniVc: AnimationViewController = self.storyboard?.instantiateViewController(identifier: "AnimationViewController") as? AnimationViewController else {return}
        aniVc.modalPresentationStyle = .custom
        //segue 하기 전에 트렌지션 델리게이트를 지정한다. 그래서 이제 UIKit 는 Home ViewController 에게 segue 전에 항상 묻는 것. 그런데 여기서 우리는 delegate 를 self 로 지정했기 때문에 항상 사용자지정 애니메이션으로 넘어간다고 이해함.
        aniVc.transitioningDelegate = self
        self.present(aniVc, animated: true, completion: nil)
        
    }
    
}

// MARK: - UIViewcontrollerTransitionDelegate

extension ViewController: UIViewControllerTransitioningDelegate {
    //언제, 어떤 애니메이션으로 화면을 전환할건가?? (present)
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = true
      return transition
    }
    
    //dismiss 할 때의 애니메이션 선택 없으면 nil
    //You check which view controller was dismissed and decide whether to return nil and use the default animation or to return a custom transition animator and use that instead.
    func animationController(forDismissed dismissed: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
      return transition
    }
}
