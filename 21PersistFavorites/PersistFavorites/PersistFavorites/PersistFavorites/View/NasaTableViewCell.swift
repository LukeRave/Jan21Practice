//
//  NasaTableViewCell.swift
//  PersistFavorites
//
//  Created by ravebizz on 2/4/22.
//

import UIKit

class NasaTableViewCell: UITableViewCell {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heartIcon: UIImageView!
    
    static let identifier = String(describing: NasaTableViewCell.self)
}
