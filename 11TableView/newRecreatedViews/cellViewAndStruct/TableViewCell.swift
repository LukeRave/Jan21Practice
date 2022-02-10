//
//  TableViewCell.swift
//  tableViews
//
//  Created by Cameryn Williams on 2/6/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = String(describing: TableViewCell.self)
    
    
    @IBOutlet weak var itemNumber: UILabel!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Status: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
