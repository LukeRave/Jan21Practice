//
//  musicCell.swift
//  listMusic
//
//  Created by Rave Bizz on 1/29/22.
//

import UIKit

class musicCell: UITableViewCell {

    static let identifier = String(describing: musicCell.self)
    
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var albumCover: UIImageView!
    
}
