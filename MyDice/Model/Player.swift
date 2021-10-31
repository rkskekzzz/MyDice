//
//  User.swift
//  MyDice
//
//  Created by su on 2021/10/16.
//

import Foundation

struct Player {
    private var id: String
    private var _name: String
    private var diceCount: Int
    private var defaultDiceCount: Int
    
    private var rangeOfDiceValue: ClosedRange<Int>
    
    mutating
    func resetDiceCount() { self.diceCount = defaultDiceCount }
    func getDiceCount() -> Int { diceCount }
    
    mutating
    func takeDice(from player: Player) {
        self.diceCount += player.diceCount
    }
    
    mutating
    func setName(_ name: String) { self._name = name }
    func getName() -> String { _name }
    
    var getId: String { id }
    
    func sumOfRollDice() -> Int {
        var sum: Int = 0
        
        for _ in 1...diceCount  {
            sum += Int.random(in: rangeOfDiceValue)
        }
        
        return sum
    }
    
    init(id: String, name: String, diceCount: Int, result: Int? = nil, defaultDiceCount: Int = 1, rangeOfDiceValue: ClosedRange<Int> = 1...6) {
        self.id = id
        self._name = name
        self.diceCount = diceCount
        self.defaultDiceCount = defaultDiceCount
        self.rangeOfDiceValue = rangeOfDiceValue
    }
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
