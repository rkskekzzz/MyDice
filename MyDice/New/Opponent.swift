//
//  Match.swift
//  MyDice
//
//  Created by su on 2021/10/16.
//

import Foundation

struct Opponent {
    var name: String
    var diceCount: Int
    var result: Int?
}

extension Opponent {
    static var testData = [
            Opponent(name: "ycha", diceCount: 1),
            Opponent(name: "suhshin", diceCount: 2),
            Opponent(name: "echung", diceCount: 3),
            Opponent(name: "kyuhkim", diceCount: 4),
            Opponent(name: "ddip", diceCount: 5),
            Opponent(name: "dice", diceCount: 6),
            Opponent(name: "com", diceCount: 7)
    ]
}
