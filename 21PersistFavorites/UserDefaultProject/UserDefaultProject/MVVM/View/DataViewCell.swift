//
//  DataViewCell.swift
//  UserDefaultProject
//
//  Created by Rave Bizz on 2/7/22.
//

import UIKit

class DataViewCell: UITableViewCell {
    
    @IBOutlet weak var idNumber: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var fav: UIButton!
    static let identifier = String(describing: DataViewCell.self)
    
    var indexPath: IndexPath?
    var bool: Bool?
    
    @IBAction func favPressed(_ sender: UIButton) {
        sender.setImage(UIImage(systemName: "suit.heart"), for: UIControl.State.normal)
        
        if  sender.image(for: .normal) == UIImage(systemName: "suit.heart"){
            sender.isHidden = true
        }
    }
}

