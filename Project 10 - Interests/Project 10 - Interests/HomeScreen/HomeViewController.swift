//
//  HomeViewController.swift
//  Project 10 - Interests
//
//  Created by 송서영 on 2021/01/26.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    //dummy data 가져오기
    private var interest = Interest.createInterests()
    override func viewDidLoad() {
        super.viewDidLoad()
//        makeFlowLayout()
        // Do any additional setup after loading the view.
    }
    
    func makeFlowLayout() {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 500, height: 600)
        flowLayout.minimumInteritemSpacing = 50
        flowLayout.minimumLineSpacing = 30
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interest.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "interestCell", for: indexPath) as? InterestCollectionViewCell else {return UICollectionViewCell()}
        cell.interest = interest[indexPath.row]
        cell.layer.cornerRadius = 8.0
        cell.clipsToBounds = true
        return cell
    }
    
    
}
