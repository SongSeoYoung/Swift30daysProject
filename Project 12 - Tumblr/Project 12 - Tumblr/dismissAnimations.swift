//
//  dismissAnimations.swift
//  Project 12 - Tumblr
//
//  Created by 송서영 on 2021/02/05.
//

import UIKit

// MARK: - dismiss animation
class DismissAni: NSObject, UIViewControllerAnimatedTransitioning {
    let duration: TimeInterval = 1.0
    var presenting: Bool = true
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!, transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!)
        let menuViewController = screens.from as! AnimationViewController 
        guard let fromView = transitionContext.view(forKey: .from) else {return}
        //MARK: animation
        UIView.animate(
          withDuration: duration,
          animations: {
            print("dismiss animation")
            fromView.alpha = 0.0
//            toView.alpha = 1.0
          },
          completion: { _ in
            //이것은 UIKit에게 전환 애니메이션이 완료되었으며 UIKit이 뷰 컨트롤러 전환을 자유롭게 래핑 할 수 있음을 알려줍니다.
            //This must be called whenever a transition completes (or is cancelled.)
            transitionContext.completeTransition(true)
          }
        )
        
        menuViewController.photoTrailing.constant = -200
        menuViewController.textLeading.constant = -200
        
        
        UIView.animate(withDuration: duration, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [.curveEaseInOut], animations: {
            fromView.layoutIfNeeded()
        }, completion: {_ in
            transitionContext.completeTransition(true)
        })
        
        menuViewController.quoteLeading.constant = -200
        menuViewController.auidoTrailing.constant = -200
        UIView.animate(withDuration: duration, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [.curveEaseInOut], animations: {
            fromView.layoutIfNeeded()
        }, completion: {_ in
            transitionContext.completeTransition(true)
        })
        
        menuViewController.chatLeading.constant = -200
        menuViewController.linkTrailing.constant = -200
        UIView.animate(withDuration: duration, delay: 0.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: [.curveEaseInOut], animations: {
            fromView.layoutIfNeeded()
        }, completion: {_ in
            transitionContext.completeTransition(true)
        })
    }
    
    
}

