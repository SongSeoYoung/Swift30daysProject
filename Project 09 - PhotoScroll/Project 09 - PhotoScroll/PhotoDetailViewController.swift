//
//  PhotoDetailViewController.swift
//  Project 09 - PhotoScroll
//
//  Created by 송서영 on 2021/01/23.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var PhotoImage: UIImageView!
    let PhotoList: Photo = Photo()
    var number: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let indexNumber = self.number {
            print(indexNumber, "detail index")
            self.PhotoImage.image = PhotoList.photoList[indexNumber]
        }
        
    }
    

}
