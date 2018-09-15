//
//  TableViewCell.swift
//  Day 10 - GitRepository
//
//  Created by Felix ITs 04 on 15/09/18.
//  Copyright © 2018 Akash. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var lblPassword: UILabel!
    @IBOutlet var lblUserID: UILabel!
    @IBOutlet var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
