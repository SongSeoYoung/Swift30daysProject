//
//  DetailViewController.swift
//  Project 11 - Animations
//
//  Created by 송서영 on 2021/02/03.
//

import UIKit

class DetailViewController: UIViewController {

    var rowTitle: String?
    var number: Int?
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var topConstraints: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraints: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraints: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraints: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = self.rowTitle
    }
    
    func setSizeAndColor(_ color: UIColor, _ size: CGFloat){
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.curveEaseInOut],
                       animations: {[weak self] in
                        self?.redView.backgroundColor = color
                        self?.redView.transform = CGAffineTransform(scaleX: size, y: size)
                       },
                       completion: {[weak self]_ in
                        UIView.animate(withDuration: 1,
                                       delay: 0,
                                       options: [.curveEaseInOut],
                                       animations: {[weak self] in
                                        self?.redView.backgroundColor = .green
                                        self?.redView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                                       },
                                       completion: nil)
                       })
    }
    
    @IBAction func tapBtn(_ sender: Any) {
        switch rowTitle {
        case "2-Color":
            UIView.transition(with: self.redView,
                              duration: 2,
                              options: [.transitionCrossDissolve],
                              animations: { [weak self] in
                                self?.redView.backgroundColor = .green
                              },
                              completion: nil)
            
        case "Simple 2D Rotation":
            UIView.animate(withDuration: 2,
                           delay: 0,
                           options: .repeat,
                           animations: { [weak self] in
                            self?.redView.transform = CGAffineTransform(rotationAngle: .pi)
                           },
                           completion: nil)
            
        case "Multicolor":
            UIView.transition(with: self.redView,
                              duration: 2,
                              options: [.transitionCrossDissolve],
                              animations: { [weak self ] in
                                self?.redView.backgroundColor = .green
                              },
                              completion: { [weak self]_ in
                                UIView.transition(with: (self?.redView)!, duration: 2, options: [.transitionCrossDissolve], animations: {self?.redView.backgroundColor = .blue}, completion: nil)
                              })
            
        case "Multi Point Position":
            let originY = self.redView.frame.origin.y
            let originX = self.redView.frame.origin.x
            UIView.animate(withDuration: 2,
                           delay: 0,
                           options: [.curveEaseInOut, .autoreverse],
                           animations: { [weak self] in
                            self?.redView.frame.origin = CGPoint(x: originX, y: 100)
                           }, completion: { _ in
                            self.redView.frame.origin = CGPoint(x: originX, y: originY)
                           })
            
        case "Color and Frame Change":
            UIView.animate(withDuration: 1,
                           delay: 0,
                           options: [.curveEaseInOut],
                           animations: {[weak self] in
                            self?.redView.backgroundColor = .orange
                            self?.redView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                           },
                           completion: { [weak self]_ in
                            self?.setSizeAndColor(.yellow, 0.9)
                           })

        case "Pop":
            UIView.animate(withDuration: 2,
                           delay: 0,
                           options: [.curveEaseInOut],
                           animations: { [weak self] in
                            self?.redView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                           },
                           completion: nil)
            
        default:
            UIView.transition(with: self.redView, duration: 3, options: [.transitionCrossDissolve], animations: {self.redView.backgroundColor = .green}, completion: nil)
        }
    }
}
