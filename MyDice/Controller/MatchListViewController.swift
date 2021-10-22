//
//  MatchListViewController.swift
//  MyDice
//
//  Created by su on 2021/10/16.
//

import UIKit

class MatchListViewController: UITableViewController {
    @IBOutlet var filterSegmentedControl: UISegmentedControl!
    
    static let showDetailSegueIdentifier = "ShowMatchDetailSegue"
    
    private var matchListDataSource: MatchListDataSource?
    private var filter: MatchListDataSource.Filter {
           return MatchListDataSource.Filter(rawValue: filterSegmentedControl.selectedSegmentIndex) ?? .all
       }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.showDetailSegueIdentifier,
           let destination = segue.destination as? MatchDetailViewController,
           let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            let rowIndex = indexPath.row
            guard let opponent = matchListDataSource?.opponent(at: rowIndex), let user = matchListDataSource?.user() else {
                fatalError("Couldn't find data source for reminder list.")
            }
            destination.configure(with: (opponent, user)) { //(opponent, user) in
                self.matchListDataSource?.update(($0, $1), at: rowIndex)
                self.tableView.reloadData()
            }
        }
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
        matchListDataSource = MatchListDataSource()
        tableView.dataSource = matchListDataSource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func segmentControlChanged(_ sender: Any) {
        matchListDataSource?.filter = filter
        tableView.reloadData()
    }

}

//extension MatchListViewController {
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//}
