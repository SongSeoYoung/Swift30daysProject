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
    }
    
    
}

