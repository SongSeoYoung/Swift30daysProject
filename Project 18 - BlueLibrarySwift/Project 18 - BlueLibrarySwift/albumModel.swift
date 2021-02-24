//
//  albumModel.swift
//  Project 18 - BlueLibrarySwift
//
//  Created by 송서영 on 2021/02/24.
//

import Foundation

struct albumModel: Codable {
    var albumList: [Album]
}

struct Album: Codable {
    var title: String
    var artist: String
    var genre: String
    var coverURL: String
    var year: String
}
