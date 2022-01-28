//
//  MusicCell.swift
//  SongList
//
//  Created by ravebizz on 1/27/22.
//

import UIKit

class MusicCell: UITableViewCell {
    static let identifier = String(describing: MusicCell.self)
    
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
}
