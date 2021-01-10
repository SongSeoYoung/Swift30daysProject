//
//  Model.swift
//  Project 05 - Artistry
//
//  Created by 송서영 on 2021/01/10.
//

import Foundation

struct WorkModel: Codable{
    let artists:[WorkData]
}
struct WorkData:Codable{
    var works:[Works]
}

struct Works: Codable{
    var title: String?
    var image: String?
    var info: String?
}

struct Model: Codable{
    let artists:[Artist]
}
struct Artist: Codable{
    let name: String?
    let bio: String?
    let image: String?
}
