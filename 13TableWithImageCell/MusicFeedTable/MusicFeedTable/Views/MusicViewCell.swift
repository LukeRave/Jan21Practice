//
//  MusicViewCell.swift
//  MusicFeedTable
//
//  Created by ravebizz on 1/28/22.
//

import UIKit

class MusicViewCell: UITableViewCell {

    static let identifier = String(describing: MusicViewCell.self)
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
}
