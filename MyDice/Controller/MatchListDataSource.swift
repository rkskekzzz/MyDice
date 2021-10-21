//
//  MatchListDataSource.swift
//  MyDice
//
//  Created by su on 2021/10/16.
//

import UIKit

class MatchListDataSource: NSObject {
    func update(_ match: (opponent: Opponent, user: User), at row: Int) {
        Opponent.testData[row] = match.opponent
        User.testData = match.user
    }
    
    func opponent(at row: Int) -> Opponent {
        return Opponent.testData[row]
    }
    
    func user() -> User {
        return User.testData
    }
}

extension MatchListDataSource: UITableViewDataSource {
//    typealias availableOpponent: (testData: Opponent) -> Bool
    static let reminderListCellIdentifier = "MatchListCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Opponent.testData.count
//        return Opponent.testData.filter({ $0.diceCount * 6 < }).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIdentifier, for: indexPath) as? MatchListCell else {
            fatalError("Unable to dequeue ReminderCell")
        }
        let match = Opponent.testData[indexPath.row]
        
        cell.nameLabel.text = match.name
        cell.countLabel.text = match.diceCount.description
        
        return cell
    }
}
