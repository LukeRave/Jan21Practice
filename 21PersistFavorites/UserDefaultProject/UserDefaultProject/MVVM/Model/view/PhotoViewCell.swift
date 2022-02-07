//
//  PhotoViewCell.swift
//  UserDefaultProject
//
//  Created by Rave Bizz on 2/6/22.
//

import UIKit

class PhotoViewCell: UITableViewCell {

    static let identfier = String(describing: PhotoViewCell.self)
    
 
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
