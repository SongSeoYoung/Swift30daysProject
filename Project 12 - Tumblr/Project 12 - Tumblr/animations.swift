//
//  animations.swift
//  Project 12 - Tumblr
//
//  Created by 송서영 on 2021/02/05.
//

import UIKit

class animations: NSObject, UIViewControllerAnimatedTransitioning {
    let duration: TimeInterval = 1.0
    var presenting: Bool = true
    
    //애니메이션 기간을 정의
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    //애니메이션 정의
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //containerView : 애니메이션이 발생한 위치를 얻어서 (현재 뷰)
        let containerView = transitionContext.containerView
        //새로운 뷰를 가져와서 toView 에 저장한다.
        //사용된 메서드 알아보기
        //view (forKey :) : 인수 UITransitionContextViewKey.from또는 UITransitionContextViewKey.to각각을 통해
        //"이전"및 "새"뷰 컨트롤러의 뷰에 액세스 할 수 있습니다 .
        //viewController (forKey :) : 인수 UITransitionContextViewControllerKey.from또는 UITransitionContextViewControllerKey.to각각을 통해
        //"이전"및 "새"뷰 컨트롤러에 액세스 할 수 있습니다 .
        let toView = transitionContext.view(forKey : .to)!
        containerView.addSubview(toView)
        
        
        //MARK: animation
        toView.alpha = 0.0
        UIView.animate(
          withDuration: duration,
          animations: {
            toView.alpha = 1.0
          },
          completion: { _ in
            //이것은 UIKit에게 전환 애니메이션이 완료되었으며 UIKit이 뷰 컨트롤러 전환을 자유롭게 래핑 할 수 있음을 알려줍니다.
            //This must be called whenever a transition completes (or is cancelled.)
            transitionContext.completeTransition(true)
          }
        )
        
        
    }

}
