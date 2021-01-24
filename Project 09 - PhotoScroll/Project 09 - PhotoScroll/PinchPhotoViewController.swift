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
    var firstHeight: CGFloat?
    var firstWidth: CGFloat?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("pinch")
        if let indexNumber = self.number {
            print(indexNumber)
            pinchPhoto.image = photoList.photoList[indexNumber]
        }
        pinchPhoto.isUserInteractionEnabled = true

        firstHeight = self.pinchPhoto.frame.height
        firstWidth = self.pinchPhoto.frame.width
    }
    
    
    

    @IBAction func pinchAction(_ sender: Any) {
        let newWidth = pinchGesture.scale * self.pinchPhoto.frame.width
        let newHeight = pinchGesture.scale * self.pinchPhoto.frame.height
        
        print(newWidth, newHeight)
        
        guard let originWidth = self.firstWidth,
              let originHeight = self.firstHeight else { return }
        if (newWidth < originWidth) && (newHeight < originHeight) {
            print("minumum")
            pinchPhoto.frame.size = CGSize(width: originWidth, height: originHeight)
            pinchGesture.scale = 1.0
        }
        pinchPhoto.transform = pinchPhoto.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
        pinchGesture.scale = 1.0
    }
    
    
}
