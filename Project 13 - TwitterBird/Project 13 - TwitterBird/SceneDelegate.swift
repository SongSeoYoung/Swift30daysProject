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
            print("window is window")
            
            
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
            
            //            animateMask()
            
            window.rootViewController = UIViewController()
            window.backgroundColor = .blue
            //윈도우를 만들어주는 메서드
            //            This is a convenience method to show the current window and position it in front of all other windows at the same level or lower.
            //            window.makeKeyAndVisible()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                UIView.animate(withDuration: 5,
                               delay: 0,
                               options: .curveEaseInOut,
                               animations: { [weak self] in
                                self?.twittermask!.bounds = CGRect(x: 0, y: 0, width: 80, height: 80)
                               },
                               completion: {[weak self]_ in
                                self?.twittermask!.bounds = CGRect(x: 0, y: 0, width: 3000, height: 3000)
                                self?.imageView?.mask = nil
                               })
            }

        }
        
    }
    func animateMask() {
        // init key frame animation
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 1
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 1
        
        // animate zoom in and then zoom out
        let initalBounds = NSValue(cgRect: twittermask!.bounds)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 80, height: 64))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 2000, height: 2000))
        keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]
        
        // set up time interals
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        
        // add animation to current view
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut), CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)]
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

