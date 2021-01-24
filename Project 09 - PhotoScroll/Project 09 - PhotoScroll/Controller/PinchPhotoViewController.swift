//
//  PinchPhotoViewController.swift
//  Project 09 - PhotoScroll
//
//  Created by 송서영 on 2021/01/23.
//

import UIKit

class PinchPhotoViewController: UIViewController{

    @IBOutlet private weak var pinchPhoto: UIImageView!
    @IBOutlet private var pinchGesture: UIPinchGestureRecognizer!
    private let photoList: Photo = Photo()
    var number: Int?
    private var firstHeight: CGFloat?
    private var firstWidth: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
    }
    
    // index number 받아와서 이미지세팅
    private func setImage() {
        if let indexNumber = self.number {
            print(indexNumber)
            pinchPhoto.image = photoList.photoList[indexNumber]
        }
        pinchPhoto.isUserInteractionEnabled = true

        firstHeight = self.pinchPhoto.frame.height
        firstWidth = self.pinchPhoto.frame.width
    }
    

    @IBAction func pinchAction(_ sender: Any) {
        //pinch 된 이미지 크기
        let newWidth = pinchGesture.scale * self.pinchPhoto.frame.width
        let newHeight = pinchGesture.scale * self.pinchPhoto.frame.height
        
        guard let originWidth = self.firstWidth,
              let originHeight = self.firstHeight else { return }
        //최소사이즈 설정
        if (newWidth < originWidth) && (newHeight < originHeight) {
            print("minumum")
            pinchPhoto.frame.size = CGSize(width: originWidth, height: originHeight)
            pinchGesture.scale = 1.0
        }
        pinchPhoto.transform = pinchPhoto.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
        pinchGesture.scale = 1.0
    }
    
    
}
