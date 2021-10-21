//
//  SearchViewController.swift
//  MyDice
//
//  Created by su on 2021/10/15.
//

import UIKit

class SearchListViewController: UITableViewController {
    static let matchSegueIdentifier = "MatchSegueIdentifier"
    private var searchListDataSource: SearchListDataSource?
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let matchViewController = segue.destination as? MatchViewController else {
            fatalError("destination is not exist")
        }
        guard let cell  = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
            fatalError("cell is not exist")
        }
        
        matchViewController.receivedCom = ComData.data[indexPath.row]
                
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchListDataSource = SearchListDataSource()
        tableView.dataSource = searchListDataSource
    }
}
