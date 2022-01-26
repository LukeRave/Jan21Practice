//
//  TodoCell.swift
//  tables
//
//  Created by Luat on 1/26/22.
//

import UIKit

class TodoCell: UITableViewCell {
    
    static let identifier = String(describing: TodoCell.self)
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
}
