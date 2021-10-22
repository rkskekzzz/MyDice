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
    var resultDiceCount: (Int, Int)?
    
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
