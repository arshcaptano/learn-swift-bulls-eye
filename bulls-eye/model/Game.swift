//
//  Game.swift
//  bulls-eye
//
//  Created by Arshfod Captano on 30/03/2021.
//

import Foundation

struct Game{
    var target = Int.random(in:1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        100 - abs(target - sliderValue)
    }
}
