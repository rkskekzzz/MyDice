//
//  MyDice.swift
//  MyDice
//
//  Created by su on 2021/10/14.
//

import Foundation

enum DiceRule {
    case win, draw, lose
}

struct DiceLogic {
    var diceCount: Int?
    var resultDiceCount: (Int, Int)?
    
    mutating func setDiceCount(_ count: Int) {
        self.diceCount = count
    }
    
    func sumOfDiceRolls() -> Int {
        var sum: Int = 0
        
        guard let diceCount = diceCount else {
            fatalError("diceCount cannot be nil")
        }
        
        for _ in 1...diceCount  {
            sum += Int.random(in: 1...6)
        }
//        print("dice count : \(diceCount), sum : \(sum)")
        return sum
    }
    
    func resultOfCompetition(user: Int, com: Int) -> DiceRule {
        if user > com{
            return .win
        } else if user == com {
            return .draw
        } else {
            return .lose
        }
    }
    
}
