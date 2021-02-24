//
//  ViewModel.swift
//  Project 17 - ClassicPhotos
//
//  Created by 송서영 on 2021/02/24.
//

import Foundation
import Alamofire

class tableViewModel {
    let url = URL(string: "https://www.raywenderlich.com/downloads/ClassicPhotosDictionary.plist")
    var model: photoModel?
    var modelImageList: [String] = [String]()
    func decodeURL() {
        print("decode URL")
        guard let url = self.url else {
            print("error")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            self.model = try decoder.decode(photoModel.self, from: data)
        } catch {
            print(error)
        }
    }
    func getModelCount() {
        return model.
    }
}
