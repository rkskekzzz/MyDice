//
//  User.swift
//  MyDice
//
//  Created by su on 2021/10/16.
//

import Foundation

struct Player {
    var name: String
    var diceCount: Int
    var result: Int?
}

extension Player {
    static var testUser = Player(name: "hahahaha", diceCount: 1)
    static var testOpponent = [
        Player(name: "ycha", diceCount: 1),
        Player(name: "suhshin", diceCount: 2),
        Player(name: "echung", diceCount: 3),
        Player(name: "kyuhkim", diceCount: 4),
        Player(name: "ddip", diceCount: 5),
        Player(name: "dice", diceCount: 6),
        Player(name: "com", diceCount: 7)
    ]
}
