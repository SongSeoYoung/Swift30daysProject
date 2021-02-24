//
//  ViewController.swift
//  Project 18 - BlueLibrarySwift
//
//  Created by 송서영 on 2021/02/24.
//

// MARK: - Main View

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    let viewModel: maintableViewModel = maintableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.decode()
    }

}
