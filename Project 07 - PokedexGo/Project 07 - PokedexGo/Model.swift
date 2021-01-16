//
//  Model.swift
//  Project 07 - PokedexGo
//
//  Created by 송서영 on 2021/01/16.
//

import Foundation

struct Pokemon{
    let name: String?
    let id: Int?
    let detailInfo: String?
    let type: [PokeType]?
    let weak: [PokeType]?
    let pokeImgUrl: String?
    
    init(name: String, id: Int, detailInfo: String, type: [PokeType], weak: [PokeType], pokeImgUrl: String) {
        self.name = name
        self.id = id
        self.detailInfo = detailInfo
        self.type = type
        self.weak = weak
        self.pokeImgUrl = pokeImgUrl
    }
}

enum PokeType{
    case grass
    case fire
    case ground
    case rock
    case water
    case electric
    case bug
    case flying
    case poison
    case psychic
    case ice
}
