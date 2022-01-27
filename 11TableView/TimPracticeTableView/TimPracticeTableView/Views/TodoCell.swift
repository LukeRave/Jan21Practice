//
//  TodoCell.swift
//  TimPracticeTableView
//
//  Created by ravebizz on 1/27/22.
//

import UIKit

class TodoCell: UITableViewCell {

    static let identifier = String(describing: TodoCell.self)
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
}
