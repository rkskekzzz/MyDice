//
//  SearchViewController.swift
//  MyDice
//
//  Created by su on 2021/10/15.
//

import UIKit

class SearchListViewController: UITableViewController {
    
}

extension SearchListViewController {
    static let searchListCellIdentifier = "SearchListCell"
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ComData.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.searchListCellIdentifier, for: indexPath) as? SearchListViewCell else {
            fatalError("Unable to dequeue SearchCell")
        }

        let opponent = ComData.data[indexPath.row]
        cell.titleLabel.text = "com " +  String(indexPath.row)
        cell.diceCount.text = String(opponent.diceCount)
        return cell
    }
}
