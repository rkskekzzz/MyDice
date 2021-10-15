//
//  MatchListViewController.swift
//  MyDice
//
//  Created by su on 2021/10/16.
//

import UIKit

class MatchListViewController: UITableViewController {
    
    private var matchListDataSource: MatchListDataSource?
    
    static let showDetailSegueIdentifier = "ShowMatchDetailSegue"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.showDetailSegueIdentifier,
           let destination = segue.destination as? MatchDetailViewController,
           let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            let rowIndex = indexPath.row
            guard let opponent = matchListDataSource?.opponent(at: rowIndex), let user = matchListDataSource?.user(at: rowIndex) else {
                fatalError("Couldn't find data source for reminder list.")
            }
            destination.configure(with: (opponent, user)) { (opponent, user) in
                self.matchListDataSource?.update((opponent, user), at: rowIndex)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matchListDataSource = MatchListDataSource()
        tableView.dataSource = matchListDataSource
    }
}


