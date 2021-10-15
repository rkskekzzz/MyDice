//
//  UserData.swift
//  MyDice
//
//  Created by su on 2021/10/14.
//

import Foundation

struct UserData {
    var userName: String
    var diceCount: Int
}

extension UserData {
    static var data: UserData {
        UserData(userName: "suhshin", diceCount: 1)
    }
}

struct ComData {
    var diceCount: Int
}

extension ComData {
    static var data: [ComData] {
        [
            ComData(diceCount: 1),
            ComData(diceCount: 2),
            ComData(diceCount: 3),
            ComData(diceCount: 4),
            ComData(diceCount: 5),
            ComData(diceCount: 6),
            ComData(diceCount: 7),
            ComData(diceCount: 8),
            ComData(diceCount: 9)
        ]
    }
}
