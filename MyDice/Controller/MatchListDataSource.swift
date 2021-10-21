//
//  MatchListDataSource.swift
//  MyDice
//
//  Created by su on 2021/10/16.
//

import UIKit

class MatchListDataSource: NSObject {
    
    enum Filter: Int {
        case ableToFight
        case all
    
        func shouldInclude(opponent: Player) -> Bool {
            switch self {
            case .ableToFight:
                return (Player.testUser.diceCount * 1 <= opponent.diceCount * 6) && (Player.testUser.diceCount * 6 >= opponent.diceCount * 1)
            case .all:
                return true
            }
        }
    }
    
    var filter: Filter = .ableToFight
    var filteredOpponents: [Player] {
        return Player.testOpponent.filter {filter.shouldInclude(opponent: $0)}
    }
    
    func update(_ match: (opponent: Player, user: Player), at row: Int) {
        Player.testOpponent[row] = match.opponent
        Player.testUser = match.user
    }
    
    func opponent(at row: Int) -> Player {
        return filteredOpponents[row]
    }
    
    func user() -> Player {
        return Player.testUser
    }
}

extension MatchListDataSource: UITableViewDataSource {
    //    typealias availableOpponent: (testData: Opponent) -> Bool
    static let reminderListCellIdentifier = "MatchListCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredOpponents.count
        //        return Opponent.testData.filter({ $0.diceCount * 6 < }).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIdentifier, for: indexPath) as? MatchListCell else {
            fatalError("Unable to dequeue ReminderCell")
        }
        let match = filteredOpponents[indexPath.row]
        
        cell.nameLabel.text = match.name
        cell.countLabel.text = match.diceCount.description
        
        return cell
    }
}
