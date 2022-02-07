//
//  DataViewCell.swift
//  UserDefaultProject
//
//  Created by Rave Bizz on 2/7/22.
//

import UIKit

class DataViewCell: UITableViewCell {

    @IBOutlet weak var idNumber: UILabel!
    @IBOutlet weak var date: UILabel!
    
    
    
    static let identifier = String(describing: DataViewCell.self)
}
