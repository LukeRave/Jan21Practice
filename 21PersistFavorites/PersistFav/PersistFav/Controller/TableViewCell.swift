//
//  TableViewCell.swift
//  PersistFav
//
//  Created by Matthew Flores on 2/8/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var Heart: UIImageView!
    @IBOutlet weak var CellTopLabel: UILabel!
    @IBOutlet weak var CellBottomLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
