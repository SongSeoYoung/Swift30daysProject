//
//  Model.swift
//  Project 05 - Artistry
//
//  Created by 송서영 on 2021/01/10.
//

import Foundation



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

struct Model: Codable{
    let artists:[Artist]
}
struct Artist: Codable{
    let name: String?
    let bio: String?
    let image: String?
}
