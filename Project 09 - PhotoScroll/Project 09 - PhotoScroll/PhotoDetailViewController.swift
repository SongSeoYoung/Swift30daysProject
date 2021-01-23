//
//  PhotoDetailViewController.swift
//  Project 09 - PhotoScroll
//
//  Created by 송서영 on 2021/01/23.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var PhotoImage: UIImageView!
    let PhotoList: Photo = Photo()
    var number: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let indexNumber = self.number else {return }
        self.PhotoImage.image = PhotoList.photoList[indexNumber]
        pageControl.numberOfPages = PhotoList.photoList.count
        pageControl.currentPage = indexNumber
        
    }
    

}
