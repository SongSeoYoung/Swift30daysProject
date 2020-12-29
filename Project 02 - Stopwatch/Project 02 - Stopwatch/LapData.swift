//
//  LapData.swift
//  Project 02 - Stopwatch
//
//  Created by 송서영 on 2020/12/29.
//

import Foundation

struct LapData{
    var LapTitle: String
    var LapTime: String
    
    init(_ LapTitle: String, _ LapTime: String) {
        self.LapTime = LapTime
        self.LapTitle = LapTitle
    }
}
