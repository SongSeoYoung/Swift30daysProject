//
//  Model.swift
//  Project 05 - Artistry
//
//  Created by 송서영 on 2021/01/10.
//

import Foundation

struct Artist{
    var name: String?
    var bio: String?
    var image: String?
    init(_ name: String, _ bio: String, _ image: String){
        self.name = name
        self.bio = bio
        self.image = image
    }
}

struct Works{
    var title: String?
    var image: String?
    var info: String?
    init(_ title: String, _ image: String, _ info: String){
        self.title = title
        self.image = image
        self.info = info
    }
}
