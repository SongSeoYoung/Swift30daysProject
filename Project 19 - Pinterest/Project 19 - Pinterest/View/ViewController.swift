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
        // Do any additional setup after loading the view.
        viewModel.decode()
        setFlowLayout()
    }
    
    func setFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.minimumLineSpacing = 5
        flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 10, height: 150)
//        flowLayout.scrollDirection = .vertical
        self.mainCollectionView.collectionViewLayout = flowLayout
    }

}


 // MARK: - Viewcontroller DataSource Delegate FlowLayoutDelegate
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getModelCount()
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cell = mainCollectionViewCell()
//        cell.prepareForReuse()
//    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "mainCollectionViewCell", for: indexPath) as? mainCollectionViewCell else { return UICollectionViewCell() }
        cell.captionLabel.text = viewModel.photosModel?[indexPath.row]["Caption"]
        cell.commentLabel.text = viewModel.photosModel?[indexPath.row]["Comment"]
        if let photoNumber = viewModel.photosModel?[indexPath.row]["Photo"] {
            cell.imageView.image = UIImage(named: photoNumber)
        }
   
        return cell
    }


}
