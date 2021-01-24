//
//  PhotoDetailViewController.swift
//  Project 09 - PhotoScroll
//
//  Created by 송서영 on 2021/01/23.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIGestureRecognizerDelegate{

    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var photoImage: UIButton!
    
    private let PhotoList: Photo = Photo()
    var number: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPageViews()

    }
    
    //pageView Controller 설정 + pageControl 설정
    private func setPageViews() {
        guard let indexNumber = self.number else {return }
        self.photoImage.setImage(PhotoList.photoList[indexNumber], for: .normal)
        pageControl.numberOfPages = PhotoList.photoList.count
        pageControl.currentPage = indexNumber
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as? PinchPhotoViewController)?.number = self.number
    }

}
