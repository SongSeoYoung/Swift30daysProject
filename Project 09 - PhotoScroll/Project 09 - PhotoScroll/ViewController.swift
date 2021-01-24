//
//  ViewController.swift
//  Project 09 - PhotoScroll
//
//  Created by 송서영 on 2021/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PhotoCollectionView: UICollectionView!
    let photoModel: Photo = Photo.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        flowLayout.minimumLineSpacing = 20
//        flowLayout.minimumInteritemSpacing = 10
        let cellWidth: CGFloat = UIScreen.main.bounds.width / 5
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        PhotoCollectionView.collectionViewLayout = flowLayout
        PhotoCollectionView.delegate = self
        PhotoCollectionView.dataSource = self
    }


}
extension ViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let containerVc: ContainerViewController = self.storyboard?.instantiateViewController(identifier: "ContainerViewController") as? ContainerViewController else {return }
//        containerVc.number = indexPath.row
//        self.navigationController?.pushViewController(containerVc, animated: true)
//    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(photoModel.photoList.count)
        return photoModel.photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PhotoCollectionViewCell = PhotoCollectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else {return UICollectionViewCell() }
        cell.cellPhoto.image = photoModel.photoList[indexPath.row]
        return cell
    }
    
    
}
