//
//  SceneDelegate.swift
//  Project 13 - TwitterBird
//
//  Created by 송서영 on 2021/02/07.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, CAAnimationDelegate {
    
    var window: UIWindow?
    var twittermask: CALayer?
    var imageView: UIImageView?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let window = window {
           
            let image: UIImage = UIImage(named: "twitterScreen")!
            imageView = UIImageView(frame: window.frame)
            imageView!.image = image
            window.addSubview(imageView!)
            
            twittermask = CALayer()
            twittermask!.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
            //UIImage 가 안되는 이유!
            //CALayer 는 비트맵으로 드로잉하기때문에 UIImage 이밎 데이터가 아니라
            //CoreGraphics UIKit 보다 더 하드웨어적인 cg로 변경해서 비트맵화시켜야함
            twittermask!.contents = UIImage(named: "twitterBird")?.cgImage
            twittermask!.position = window.center
            
            imageView!.layer.mask = twittermask
            
            animateMask()
            
            //여러개의 애니메이션을 연결해야하는 경우에,, keyframeAnimation 을 사용하면 편하겠지?
            
            //            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            //                UIView.animate(withDuration: 5,
            //                               delay: 0,
            //                               options: .curveEaseInOut,
            //                               animations: { [weak self] in
            //                                self?.twittermask!.bounds = CGRect(x: 0, y: 0, width: 80, height: 80)
            //                               },
            //                               completion: {[weak self]_ in
            //                                self?.twittermask!.bounds = CGRect(x: 0, y: 0, width: 3000, height: 3000)
            //                                self?.imageView?.mask = nil
            //                               })
            //            }
            
            window.rootViewController = UIViewController()
            window.backgroundColor = UIColor(red: 70/255, green: 154/255, blue: 233/255, alpha: 1)
            
        }
        
    }
    
    // MARK: - making with keyFrameAnimation
    
    func animateMask() {
        
        //객체만들기
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 1.3        //전체 Duration
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5        //시작타임
        
        // 애니메이션이 될 프로퍼티들 속성 값 변경
        let initalBounds = twittermask!.bounds
        let secondBounds = CGRect(x: 0, y: 0, width: 80, height: 64)
        let finalBounds = CGRect(x: 0, y: 0, width: 3000, height: 3000)
        // 애니메이션에 적용시킬 프로퍼티들에 대한 집합 -> 애니메이션에 더해줌
        keyFrameAnimation.values = [initalBounds,secondBounds, finalBounds]
        
        // 각 애니메이션의 duration
        keyFrameAnimation.keyTimes = [0,0.3, 1]
        
        // 애니메이션 실행 옵션? 타이밍 처리 해주기
        //이니셜라이저 (name: ) 을 사용하면 이미 정해진 것들을 이용해서 표현할 수 있다.
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut), CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)]
        //애니메이션 더해주기
        twittermask!.add(keyFrameAnimation, forKey: "bounds")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        imageView?.layer.mask = nil
    }
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

