//
//  collectionViewModel.swift
//  Project 19 - Pinterest
//
//  Created by 송서영 on 2021/02/25.
//

import Foundation

class collectionViewModel {
    
   
    let path = Bundle.main.path(forResource: "Photos", ofType: "plist")
    var photosModel: [[String: String]]?
    func decode() {
        let url = URL(fileURLWithPath: path!)
        let data = try? Data(contentsOf: url)
        guard let plist = try? PropertyListSerialization.propertyList(from: data!, options: .mutableContainers, format: nil) as? [[String: String]] else {return}
        self.photosModel = plist
    }
    
    func getModelCount() -> Int {
        self.photosModel?.count ?? 0
    }
}
