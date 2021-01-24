//
//  PinchPhotoViewController.swift
//  Project 09 - PhotoScroll
//
//  Created by 송서영 on 2021/01/23.
//

import UIKit

class PinchPhotoViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var pinchPhoto: UIImageView!
    let photoList: Photo = Photo()
    @IBOutlet var pinchGesture: UIPinchGestureRecognizer!
    var number: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let indexNumber = self.number {
            pinchPhoto.image = photoList.photoList[indexNumber]
        }
        pinchPhoto.isUserInteractionEnabled = true

    }
    

    @IBAction func pinchAction(_ sender: Any) {
        pinchPhoto.transform = pinchPhoto.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
        pinchGesture.scale = 1.0
    }
}
