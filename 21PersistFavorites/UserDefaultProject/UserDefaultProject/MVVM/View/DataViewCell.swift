//
//  DataViewCell.swift
//  UserDefaultProject
//
//  Created by Rave Bizz on 2/6/22.
//

import UIKit

class DataViewCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var idNumber: UILabel!
    
    static let identifier = String(describing: DataViewCell.self)
    
}
