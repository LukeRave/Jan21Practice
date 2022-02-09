//
//  NASAimgTableViewCell.swift
//  NASAStalker
//
//  Created by Rave Training on 2/7/22.
//

import UIKit

class NASAimgTableViewCell: UITableViewCell {
    static let identifier = String(describing: NASAimgTableViewCell.self)
    @IBOutlet weak var imageIDLabel: UILabel!
    @IBOutlet weak var imageRoverName: UILabel!
    @IBOutlet weak var imageIsFavorite: UIImageView!
}
