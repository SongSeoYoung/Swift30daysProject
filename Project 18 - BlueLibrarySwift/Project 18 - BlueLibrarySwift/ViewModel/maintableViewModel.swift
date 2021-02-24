//
//  maintableViewModel.swift
//  Project 18 - BlueLibrarySwift
//
//  Created by 송서영 on 2021/02/24.
//

import UIKit

class maintableViewModel {
    
    var model: [albumModel]?
    
    func decode() {
        let jsonDecoder = JSONDecoder()
        guard let albumAsset = NSDataAsset(name: "albums") else { return }
        do {
            self.model = try jsonDecoder.decode([albumModel].self, from: albumAsset.data)
            print("decode success")
            print(model)
        } catch {
            print(error)
        }
    }
    
    func getModelCount() -> Int? {
        return self.model?.count
    }
}
