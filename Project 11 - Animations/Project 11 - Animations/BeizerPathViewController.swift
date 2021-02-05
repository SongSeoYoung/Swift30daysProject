//
//  BeizerPathViewController.swift
//  Project 11 - Animations
//
//  Created by 송서영 on 2021/02/03.
//

import UIKit

class BeizerPathViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setCircleView()
        // Do any additional setup after loading the view.
    }
    func setCircleView() {
        self.redView.layer.cornerRadius = self.redView.frame.height / 2
        self.redView.clipsToBounds = false
        
    }
    func setUI() {
        let path: UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: 30, y: 30))
        path.addLine(to: CGPoint(x: 30, y: 100))
        path.stroke()
        
    }

}
