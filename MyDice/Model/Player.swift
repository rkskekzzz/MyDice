//
//  User.swift
//  MyDice
//
//  Created by su on 2021/10/16.
//

import Foundation

struct Player {
    var id: String
    var name: String
    var diceCount: Int
    var result: Int?
}

extension Player {
    static var testUser = Player(id: UUID().uuidString, name: "hahahaha", diceCount: 1)
    static var testOpponent = [
        Player(id: UUID().uuidString, name: "ycha", diceCount: 1),
        Player(id: UUID().uuidString, name: "suhshin", diceCount: 2),
        Player(id: UUID().uuidString, name: "echung", diceCount: 6),
        Player(id: UUID().uuidString, name: "kyuhkim", diceCount: 9),
        Player(id: UUID().uuidString, name: "ddip", diceCount: 5),
        Player(id: UUID().uuidString, name: "dice", diceCount: 6),
        Player(id: UUID().uuidString, name: "com", diceCount: 7),
        Player(id: UUID().uuidString, name: "mac", diceCount: 1),
        Player(id: UUID().uuidString, name: "window", diceCount: 1),
        Player(id: UUID().uuidString, name: "linux", diceCount: 25),
        Player(id: UUID().uuidString, name: "swift", diceCount: 44),
        Player(id: UUID().uuidString, name: "c++", diceCount: 35),
        Player(id: UUID().uuidString, name: "node.js", diceCount: 140),
        Player(id: UUID().uuidString, name: "java", diceCount: 70)
    ]
}
