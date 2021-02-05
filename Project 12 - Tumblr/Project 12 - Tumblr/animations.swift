//
//  animations.swift
//  Project 12 - Tumblr
//
//  Created by 송서영 on 2021/02/05.
//

import UIKit

// MARK: animations 객체
class animations: NSObject, UIViewControllerAnimatedTransitioning{
    
    private let duration: TimeInterval = 1.0
    var presenting: Bool?
    
    
    //MARK: - 애니메이션 기간을 정의
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    //MARK: - 애니메이션 정의
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        //containerView : 애니메이션이 발생한 위치를 얻어서 (현재 뷰)
        let containerView = transitionContext.containerView
        
        //(from: to: )를 가지고있는 튜플
        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!, transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!)
        
        //presenting 에 따라서.. (옵셔널바인딩 후 사용)
        if let presentingValue = self.presenting{
            //MARK: - !! Presenting !!
           if presentingValue {
            //각 from, to 에 따라서 Viewcontroller 와 view 를 정의해줌
            let menuViewController = screens.to as! AnimationViewController
//            let homeViewController = screens.from as! ViewController
            guard let toView = menuViewController.view else {return}
//            guard let fromView = homeViewController.view else {return}
            
            //present 니까 addSubView해준다
            containerView.addSubview(toView)
            
            //MARK: - animation
            
            menuViewController.photoTrailing.constant = 45
            menuViewController.textLeading.constant = 45
            
            UIView.animate(withDuration: duration, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [.curveEaseInOut], animations: {
                toView.layoutIfNeeded()
            }, completion: {_ in
//                transitionContext.completeTransition(true)
            })
            
            menuViewController.quoteLeading.constant = 45
            menuViewController.auidoTrailing.constant = 45
            UIView.animate(withDuration: duration, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [.curveEaseInOut], animations: {
                toView.layoutIfNeeded()
            }, completion: {_ in
//                transitionContext.completeTransition(true)
            })
            
            menuViewController.chatLeading.constant = 45
            menuViewController.linkTrailing.constant = 45
            UIView.animate(withDuration: duration, delay: 0.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: [.curveEaseInOut], animations: {
                toView.layoutIfNeeded()
            }, completion: {_ in
//                transitionContext.completeTransition(true)
            })
            
            toView.alpha = 0.0
            UIView.animate(
                withDuration: duration, delay: 0,
                options: [.curveEaseInOut],
                animations: {
                    toView.alpha = 1.0
                },
                completion: { _ in
                    //이것은 UIKit에게 전환 애니메이션이 완료되었으며 UIKit이 뷰 컨트롤러 전환을 자유롭게 래핑 할 수 있음을 알려줍니다.
                    //This must be called whenever a transition completes (or is cancelled.)
                    transitionContext.completeTransition(true)
                }
            )
        }   // MARK: - !! Dismissing !! 
           else{
            let menuViewController = screens.from as! AnimationViewController
//            let homeViewController = screens.to as! ViewController
            guard let fromView = menuViewController.view else {return}
//            guard let fromView = homeViewController.view else {return}
            
            
            //MARK: - animation
            UIView.animate(
              withDuration: duration,
              animations: {
                fromView.alpha = 0.0
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
//                transitionContext.completeTransition(true)
            })
            
            menuViewController.quoteLeading.constant = -200
            menuViewController.auidoTrailing.constant = -200
            UIView.animate(withDuration: duration, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [.curveEaseInOut], animations: {
                fromView.layoutIfNeeded()
            }, completion: {_ in
//                transitionContext.completeTransition(true)
            })
            
            menuViewController.chatLeading.constant = -200
            menuViewController.linkTrailing.constant = -200
            UIView.animate(withDuration: duration, delay: 0.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: [.curveEaseInOut], animations: {
                fromView.layoutIfNeeded()
            }, completion: {_ in
//                transitionContext.completeTransition(true)
            })
            
        }
        }

    }
    
}


