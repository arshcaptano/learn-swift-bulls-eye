//
//  bulls_eyeTests.swift
//  bulls-eyeTests
//
//  Created by Arshfod Captano on 31/03/2021.
//

import XCTest
@testable import bulls_eye

class bulls_eyeTests: XCTestCase {
    
    var game: Game!

    override func setUpWithError() throws {
       game = Game()
    }

    override func tearDownWithError() throws {
      game = nil
    }
    
    func testScorePositive(){
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative(){
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        
        XCTAssertEqual(score, 95)
    }

}
