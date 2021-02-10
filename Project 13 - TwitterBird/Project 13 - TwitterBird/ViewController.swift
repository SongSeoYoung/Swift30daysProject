//
//  ViewController.swift
//  Project 13 - TwitterBird
//
//  Created by 송서영 on 2021/02/07.
//

import UIKit

class ViewController: UIViewController {
//    var backgroundLayer: CALayer = CALayer()
//    var twitterLayer: CALayer = CALayer()
//
//    @IBOutlet weak var backgroundImg: UIImageView!
//    @IBOutlet var rootView: UIView!
//
//    let tapgesture = UITapGestureRecognizer()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setLayer()
//        rootView.backgroundColor = UIColor.blue
//        print("view did load")
//        tapgesture.delegate = self
//    }
//
//    func setLayer() {
//        twitterLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
//        twitterLayer.position = rootView.center
//        twitterLayer.contents = UIImage(named: "twitterBird")?.cgImage
//
//        backgroundImg.layer.mask = twitterLayer
//
//    }
//
//


}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("애니메이션 실행")
        return true
    }
}
