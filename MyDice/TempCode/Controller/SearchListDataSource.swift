//
//  SearchListDataSource.swift
//  MyDice
//
//  Created by su on 2021/10/15.
//

import UIKit

class SearchListDataSource: NSObject {
    
}

extension SearchListDataSource: UITableViewDataSource {
    static let searchListCellIdentifier = "SearchListCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ComData.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.searchListCellIdentifier, for: indexPath) as? SearchListViewCell else {
            fatalError("Unable to dequeue SearchCell")
        }

        let opponent = ComData.data[indexPath.row]
        cell.configure(title: "com " + String(indexPath.row), count: String(opponent.diceCount))
        return cell
    }
    
}
