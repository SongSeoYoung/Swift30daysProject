//
//  Model.swift
//  Project 08 - SimpleRSSReader
//
//  Created by 송서영 on 2021/01/18.
//

import Foundation

struct Model{
    var title:String?
    var pubDate: Date?
    var itemDescription: String?
    init(_ title: String, _ date: Date, _ itemDescription: String){
        self.title = title
        pubDate = date
        self.itemDescription = itemDescription
    }
}
