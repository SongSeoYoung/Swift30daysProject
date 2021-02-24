//
//  ViewController.swift
//  Project 18 - BlueLibrarySwift
//
//  Created by 송서영 on 2021/02/24.
//

// MARK: - Main View

import UIKit
import Kingfisher

class ViewController: UIViewController {

    // MARK: - Properties
    private let viewModel: maintableViewModel = maintableViewModel()
    private var selectNumber: Int?
    
   // MARK: - IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var albumLabel: UILabel!
    @IBOutlet private weak var artistLabel: UILabel!
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.decode()
        setCollectionviewFlowLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setInitailUI()
    }
    
    // MARK: - Methods
    private func setInitailUI () {
        let initInfo = viewModel.setDetailInfo(0)
        yearLabel.text = initInfo[0]
        artistLabel.text = initInfo[1]
        genreLabel.text = initInfo[2]
        albumLabel.text = initInfo[3]
    }
    
    private func setCollectionviewFlowLayout() {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        flowLayout.minimumLineSpacing = 25
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 3) - 10, height: (UIScreen.main.bounds.width / 3) - 10)
        flowLayout.scrollDirection = .horizontal
        self.collectionView.collectionViewLayout = flowLayout
    }
    
    @IBAction private func trashBtn(_ sender: Any) {
        if let selectRowNumber = selectNumber {
            viewModel.addTashList(at: selectRowNumber)
        }
        collectionView.reloadData()
    }
    @IBAction private func undoBtn(_ sender: Any) {
        viewModel.undoModel()
        collectionView.reloadData()
    }

}

// MARK: - UICollectionViewDelegate, DataSource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getModelCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: AlbumArtCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumArtCollectionViewCell", for: indexPath) as? AlbumArtCollectionViewCell else { return UICollectionViewCell() }
        let url = viewModel.getURL(indexPath.row) as? URL
        if let imageView = cell.albumArtImage {
            imageView.kf.setImage(with: url)
        }
        
        cell.albumImageBackground.backgroundColor = .black
        if let number = selectNumber {
            if number == indexPath.row {
                cell.albumImageBackground.backgroundColor = .white
            }
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailInfo = viewModel.setDetailInfo(indexPath.row)
        yearLabel.text = detailInfo[0]
        artistLabel.text = detailInfo[1]
        genreLabel.text = detailInfo[2]
        albumLabel.text = detailInfo[3]
        selectNumber = indexPath.row
 
        collectionView.reloadData()
    }
    
}
