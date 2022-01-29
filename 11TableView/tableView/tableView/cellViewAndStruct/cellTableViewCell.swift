//
//  cellTableViewCell.swift
//  tableView
//
//  Created by Rave Bizz on 1/27/22.
//

import UIKit

class cellTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: cellTableViewCell.self)
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellStatus: UILabel!
    @IBOutlet weak var cellDesc: UILabel!
    

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        //viewDidLoad
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        //actionWhenSelected
//        // Configure the view for the selected state
//    }
    
}
