//
//  ContainerViewController.swift
//  Project 09 - PhotoScroll
//
//  Created by 송서영 on 2021/01/23.
//

import UIKit

//pageViewcontroller 에 대한 container Viewcontroller
class ContainerViewController: UIViewController {

    @IBOutlet private weak var containerView: UIView!
    var number: Int?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as? PageViewController)?.number = self.number
    }

}
