//
//  maintableViewModel.swift
//  Project 18 - BlueLibrarySwift
//
//  Created by 송서영 on 2021/02/24.
//

import UIKit

class maintableViewModel {
    
    var model: [albumModel]?
    
    var trashList: [albumModel] = [albumModel]()
    
    func decode() {
        let jsonDecoder = JSONDecoder()
        guard let albumAsset = NSDataAsset(name: "albums") else { return }
        do {
            self.model = try jsonDecoder.decode([albumModel].self, from: albumAsset.data)
            print("decode success")
        } catch {
            print(error)
        }
    }
    
    func addTashList(at rowNumber: Int) {
        if model?.count == 0{
            return
        }
        if rowNumber < model!.count {
            if let selectModel = model?[rowNumber] {
                trashList.append(selectModel)
                model?.remove(at: rowNumber)
            }
        } else { return }

    }
    func undoModel() {
        if let currentModel = trashList.popLast() {
            model?.append(currentModel)
        }
    }
    func setDetailInfo(_ rowNumber : Int) -> [String] {
        var detailInfo: [String] = [String]()
        if let model = self.model {
            detailInfo.append(model[rowNumber].year)
            detailInfo.append(model[rowNumber].artist)
            detailInfo.append(model[rowNumber].genre)
            detailInfo.append(model[rowNumber].title)
        }
       return detailInfo
    }
    func getModelCount() -> Int{
        guard let model = self.model else {
            return 0
        }
        return model.count
    }
    func getURL(_ rowNumber :Int ) -> Any {
        if let url = URL(string: (self.model?[rowNumber].coverUrl)!) {
            return url
        }
        return fatalError()
    }
}
