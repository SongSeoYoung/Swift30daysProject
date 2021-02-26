//
//  ViewController.swift
//  Project 19 - Pinterest
//
//  Created by 송서영 on 2021/02/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var mainCollectionView: UICollectionView!
    let viewModel: collectionViewModel = collectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.decode()
        setFlowLayout()
        
    }
    
    func setFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.minimumLineSpacing = 5
        flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 10, height: 300)
//        flowLayout.estimatedItemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 10, height: 300)
//        flowLayout.scrollDirection = .vertical
//        flowLayout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: 500)
        self.mainCollectionView.collectionViewLayout = flowLayout
    }

}


 // MARK: - Viewcontroller DataSource Delegate FlowLayoutDelegate
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getModelCount()
    }



    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("cell for item at")
        guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "mainCollectionViewCell", for: indexPath) as? mainCollectionViewCell else { return UICollectionViewCell() }
        cell.captionLabel.text = viewModel.photosModel?[indexPath.row]["Caption"]
        cell.commentLabel.text = viewModel.photosModel?[indexPath.row]["Comment"]
        if let photoNumber = viewModel.photosModel?[indexPath.row]["Photo"] {
            cell.imageView.image = UIImage(named: photoNumber)
        }
        cell.layer.cornerRadius = 12.0
        cell.backgroundColor = .red
        return cell
    }


}

// MARK: - PinterestLayoutDelegate
// photo Hiehgt 를 반환하는 Extension
extension ViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let photo: UIImage?
        if let photoNumber = viewModel.photosModel?[indexPath.row]["Photo"] {
            photo = UIImage(named: photoNumber)
            return photo?.size.height ?? 0
        }
        return 0
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("size for item at")
        guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "mainCollectionViewCell", for: indexPath) as? mainCollectionViewCell else { return CGSize(width: 0, height: 0)}
        let photo: UIImage?
        let photoHeight: CGFloat?
        guard let photoNumber = viewModel.photosModel?[indexPath.row]["Photo"] else {
            return CGSize(width: 0, height: 0)
        }
        photo = UIImage(named: photoNumber)
        photoHeight = photo?.size.height ?? 0
        let contentHeight = cell.captionLabel.bounds.height + cell.commentLabel.bounds.height
        cell.captionLabel.text = viewModel.photosModel?[indexPath.row]["Caption"]
        cell.commentLabel.text = viewModel.photosModel?[indexPath.row]["Comment"]
        if let photoNumber = viewModel.photosModel?[indexPath.row]["Photo"] {
            cell.imageView.image = UIImage(named: photoNumber)
        }
        return cell.photoBackView.systemLayoutSizeFitting(CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: UIView.layoutFittingCompressedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
//        print("image view height", photoHeight, "photoBackviewHeight", cell.photoBackView.bounds.height)
//        return CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: cell.photoBackView.bounds.height)
    }
}
