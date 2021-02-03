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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = self.rowTitle
    }
    
    func setSizeAndColor(_ color: UIColor, _ size: CGFloat){
        UIView.animate(withDuration: 4,
                       delay: 0,
                       options: [.curveEaseInOut],
                       animations: {[weak self] in
                        self?.redView.backgroundColor = color
                        self?.redView.frame.size = CGSize(width: (self?.redView.bounds.width)! * size, height: (self?.redView.bounds.height)! * size)
                        print((self?.redView.bounds.width))
                        print((self?.redView.bounds.height))
                       },
                       completion: {[weak self]_ in
                        self?.redView.backgroundColor = .green
                        self?.redView.frame.size = CGSize(width: (self?.redView.bounds.width)! * 2, height: (self?.redView.bounds.height)! * 2)
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
            print((self.redView.frame.width))
            print((self.redView.frame.height))
            UIView.animate(withDuration: 4,
                           delay: 0,
//                           options: nil,
                           animations: {[weak self] in
                            self?.redView.backgroundColor = .orange
                            self?.redView.frame.size =
                                CGSize(width: (self?.redView.bounds.width)! * 1.25,
                                       height: (self?.redView.bounds.height)! * 1.25)
                            print((self?.redView.bounds.width))
                            print((self?.redView.bounds.height))
                           },
                           completion: { [weak self]_ in
                            self?.setSizeAndColor(.yellow, 0.75)
                           })
            print((self.redView.frame.width))
            print((self.redView.frame.height))
        case "Pop":
            print(self.redView.bounds.height)
            self.redView.frame.size = CGSize(width: (self.redView.bounds.width) * 1.25, height: (self.redView.bounds.height) * 1.25)
            print(self.redView.bounds.height)
            UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
                self?.loadViewIfNeeded()
            }, completion: nil)
        default:
            UIView.transition(with: self.redView, duration: 3, options: [.transitionCrossDissolve], animations: {self.redView.backgroundColor = .green}, completion: nil)
        }
    }
}
