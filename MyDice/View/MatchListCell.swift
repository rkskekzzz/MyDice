//
//  MatchList.swift
//  MyDice
//
//  Created by su on 2021/10/16.
//

import UIKit

class MatchListCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    
    func configure(title: String, count: String) {
        self.nameLabel.text = title
        self.countLabel.text = count
    }
}
