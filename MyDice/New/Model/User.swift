//
//  User.swift
//  MyDice
//
//  Created by su on 2021/10/16.
//

import Foundation

struct User {
    var name: String
    var diceCount: Int
    var result: Int?
}

extension User {
    static var testData = User(name: "hahahaha", diceCount: 1)
}
