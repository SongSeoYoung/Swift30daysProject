//
//  ArtistryTableViewCell.swift
//  Project 05 - Artistry
//
//  Created by 송서영 on 2021/01/10.
//

import UIKit

class ArtistryTableViewCell: UITableViewCell {


//    var artistImg: UIImageView
//    var artistBio: UITextView
//    var artistNameBtn: UIButton
    @IBOutlet weak var artistImg: UIImageView!
    @IBOutlet weak var artistBio: UITextView!
    @IBOutlet weak var artistNameBtn: UIButton!
//    override class func awakeFromNib() {
//
//        contentView.addSubview(artistImg)
//        contentView.addSubview(artistBio)
//        contentView.addSubview(artistNameBtn)
//
//        artistImg.translatesAutoresizingMaskIntoConstraints = false
//        artistBio.translatesAutoresizingMaskIntoConstraints = false
//        artistNameBtn.translatesAutoresizingMaskIntoConstraints = false
//
//        if artistBio.intrinsicContentSize.height < artistImg.intrinsicContentSize.height + artistNameBtn.intrinsicContentSize.height {
//            print(artistBio.intrinsicContentSize.height, artistImg.intrinsicContentSize.height + artistNameBtn.intrinsicContentSize.height )
////            buttonAnchor.isActive = false
//            bottom.isActive = true
//            artistBio.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 751), for: .vertical)
//        } else{
//            artistBio.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
////            buttonAnchor.isActive = true
//            bottom.isActive = false
//            NSLayoutConstraint.activate([
//                artistBio.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10)
//            ])
//        }
//    }
//    var bottomConstraint: NSLayoutConstraint?
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
////        print("here")
//
//        //객체생성
//        artistImg = UIImageView()
//        artistBio = UITextView()
//        artistNameBtn = UIButton()
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        //상위뷰에 추가
//        contentView.addSubview(artistImg)
//        contentView.addSubview(artistBio)
//        contentView.addSubview(artistNameBtn)
//
//        //오토레이아웃 취소
//        artistImg.translatesAutoresizingMaskIntoConstraints = false
//        artistBio.translatesAutoresizingMaskIntoConstraints = false
//        artistNameBtn.translatesAutoresizingMaskIntoConstraints = false
//
//        //기본 레이아웃만들기
//        makeNormalConstraint(artistImg, artistBio, artistNameBtn)
//
//        if artistBio.intrinsicContentSize.height < artistImg.intrinsicContentSize.height + artistNameBtn.intrinsicContentSize.height {
//            print(artistBio.intrinsicContentSize.height, artistImg.intrinsicContentSize.height + artistNameBtn.intrinsicContentSize.height )
////            buttonAnchor.isActive = false
//            bottomConstraint!.isActive = false
//            artistBio.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 751), for: .vertical)
//        } else{
//            artistBio.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
////            buttonAnchor.isActive = true
//            bottomConstraint!.isActive = true
//            NSLayoutConstraint.activate([
//                artistBio.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10)
//            ])
//        }
//
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    func makeNormalConstraint(_ artistImg: UIImageView, _ artistBio: UITextView, _ artistButton: UIButton){
//        NSLayoutConstraint.activate([
//            artistImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            artistImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//        ])
//        bottomConstraint = artistButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
//        NSLayoutConstraint.activate([
//            artistButton.topAnchor.constraint(equalTo: artistImg.bottomAnchor, constant: 10),
//            artistButton.leadingAnchor.constraint(equalTo: artistImg.leadingAnchor),
//            artistButton.trailingAnchor.constraint(equalTo: artistImg.trailingAnchor),
////            artistButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
//        ])
//        NSLayoutConstraint.activate([
//            artistBio.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            artistBio.leadingAnchor.constraint(equalTo: artistImg.trailingAnchor, constant: 10),
//            artistBio.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            artistBio.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
//        ])
//    }
//
}
