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
                return (Player.testUser.getDiceCount() * 1 <= opponent.getDiceCount() * 6) && (Player.testUser.getDiceCount() * 6 >= opponent.getDiceCount() * 1)
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
        let opponentIndex = self.index(for: row)

        Player.testOpponent[opponentIndex] = match.opponent
        Player.testUser = match.user
    }
    
    func opponent(at row: Int) -> Player {
        return filteredOpponents[row]
    }
    
    func user() -> Player {
        return Player.testUser
    }
    
    func index(for filteredIndex: Int) -> Int {
        let filteredOpponents = filteredOpponents[filteredIndex]
        
        guard let index = Player.testOpponent.firstIndex(where: { $0.getId() == filteredOpponents.getId() }) else {
            fatalError("Couldn't retrieve index in source array")
        }
        return index
    }
    
}

extension MatchListDataSource: UITableViewDataSource {
    static let reminderListCellIdentifier = "MatchListCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredOpponents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIdentifier, for: indexPath) as? MatchListCell else {
            fatalError("Unable to dequeue ReminderCell")
        }
        
        let match = opponent(at: indexPath.row)

        cell.configure(title: match.getName(), count: match.getDiceCount().description)

        return cell
    }
}
