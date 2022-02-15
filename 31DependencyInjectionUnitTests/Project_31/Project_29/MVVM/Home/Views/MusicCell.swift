//
//  MusicCell.swift
//  Project_29
//
//  Created by Rave Bizz on 2/11/22.
//

import UIKit

class MusicCell: UITableViewCell {

    static let identifier = String(describing: MusicCell.self)
    
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumCover: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
