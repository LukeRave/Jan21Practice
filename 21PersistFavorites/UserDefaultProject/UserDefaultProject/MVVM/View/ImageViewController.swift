//
//  ImageViewController.swift
//  UserDefaultProject
//
//  Created by Rave Bizz on 2/7/22.
//

import UIKit

class ImageViewController: UIViewController {
    
    static let identifier = String(describing: ImageViewController.self)
    let defaults = UserDefaults.standard
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var idNumber: UILabel!
    @IBOutlet weak var favIcon: UIButton!
    
    // create delegate with a protocol for updating the tableview (function paramater is row, favorite status != favoritestatus
    var delegate: Favor?
    var cellId: Int?
    var image = UIImage()
    var id = 0
    var button = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let state = defaults.bool(forKey: "buttonState")
        self.button = state
        self.img.image = image
        idNumber.text = String(describing: id)
    }
    
    @IBAction func favPressed(_ sender: UIButton) {
        updateIcon(state: button)
        defaults.set(button, forKey: "buttonState")
        delegate?.updateFavorite(row: <#T##Int#>)
       
//        navigationController?.popViewController(animated: true)
        
    }
    
    private func updateIcon(state: Bool){
        if !state{
            favIcon.setImage(UIImage(systemName: "suit.heart.fill"), for: UIControl.State.normal)
            button = true
        } else {
            favIcon.setImage(UIImage(systemName: "suit.heart"), for: UIControl.State.normal)
            button = false
        }
    }
//    private func setIcon(state: Bool){
//        if state{
//            favIcon.setImage(UIImage(systemName: "suit.heart.fill"), for: UIControl.State.normal)
//        } else {
//            favIcon.setImage(UIImage(systemName: "suit.heart"), for: UIControl.State.normal)
//        }
//    }
}
