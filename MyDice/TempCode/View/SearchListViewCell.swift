//
//  SearchListViewCell.swift
//  MyDice
//
//  Created by su on 2021/10/15.
//

import UIKit

class SearchListViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var diceCount: UILabel!
    
    func configure(title: String, count: String) {
        self.titleLabel.text = title
        self.diceCount.text = count
    }
}

