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

    }
    

}

//MARK:- extension UICollectionView DataSource, Delegate
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
