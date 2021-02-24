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

   
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    let viewModel: maintableViewModel = maintableViewModel()
    var selectNumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.decode()
        setCollectionviewFlowLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        yearLabel.text = viewModel.model?[0].year
        artistLabel.text = viewModel.model?[0].artist
        genreLabel.text = viewModel.model?[0].genre
        albumLabel.text = viewModel.model?[0].title
    }
    
    func setCollectionviewFlowLayout() {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        flowLayout.minimumLineSpacing = 25
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 3) - 10, height: (UIScreen.main.bounds.width / 3) - 10)
        flowLayout.scrollDirection = .horizontal
        self.collectionView.collectionViewLayout = flowLayout
    }
    
    @IBAction func trashBtn(_ sender: Any) {
        if let selectRowNumber = selectNumber {
            viewModel.addTashList(at: selectRowNumber)
        }
        collectionView.reloadData()
    }
    @IBAction func undoBtn(_ sender: Any) {
        viewModel.undoModel()
        collectionView.reloadData()
    }
    
    

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.model?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: AlbumArtCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumArtCollectionViewCell", for: indexPath) as? AlbumArtCollectionViewCell else { return UICollectionViewCell() }
        let url = URL(string: (viewModel.model?[indexPath.row].coverUrl)!)
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
        yearLabel.text = viewModel.model?[indexPath.row].year
        artistLabel.text = viewModel.model?[indexPath.row].artist
        genreLabel.text = viewModel.model?[indexPath.row].genre
        albumLabel.text = viewModel.model?[indexPath.row].title
        selectNumber = indexPath.row
 
        collectionView.reloadData()
    }
    
}
