//
//  ViewController.swift
//  Project 13 - TwitterBird
//
//  Created by 송서영 on 2021/02/07.
//

import UIKit

class ViewController: UIViewController {
    var backgroundLayer: CALayer = CALayer()
    var twitterLayer: CALayer = CALayer()
    
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet var rootView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImg.layer.addSublayer(backgroundLayer)
        setLayer()
        print("view did load")
    }
    
    func setLayer() {
//        backgroundLayer.backgroundColor = UIColor.blue.cgColor
//        backgroundLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//
        twitterLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        twitterLayer.position = rootView.center
        twitterLayer.contents = UIImage(named: "twitterBird")?.cgImage
        
        backgroundImg.layer.mask = twitterLayer
        
        rootView.backgroundColor = UIColor.blue
    }
    
    


}

