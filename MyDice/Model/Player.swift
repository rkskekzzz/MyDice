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
        Player(name: "echung", diceCount: 6),
        Player(name: "kyuhkim", diceCount: 9),
        Player(name: "ddip", diceCount: 5),
        Player(name: "dice", diceCount: 6),
        Player(name: "com", diceCount: 7),
        Player(name: "mac", diceCount: 1),
        Player(name: "window", diceCount: 1),
        Player(name: "linux", diceCount: 25),
        Player(name: "swift", diceCount: 44),
        Player(name: "c++", diceCount: 35),
        Player(name: "node.js", diceCount: 140),
        Player(name: "java", diceCount: 70)
    ]
}
