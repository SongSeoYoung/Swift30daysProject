//
//  ListData.swift
//  Project 04 - TodoTDD
//
//  Created by 송서영 on 2021/01/04.
//

import Foundation

class ListData {
    static let shared: ListData = ListData()
    
    var title: String?
    var place: String?
    var date: String?
}
