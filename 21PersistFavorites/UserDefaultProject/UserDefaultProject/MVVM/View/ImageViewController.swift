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
    var image = UIImage()
    var id = 0
    var button: Bool?
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idNumber.text = String(describing: id)
        let state = defaults.bool(forKey: "\(self.idNumber.text ?? "")")
        print(state)
        self.button = state
        self.img.image = image
        setIcon(state: button ?? true)
    }
    
    @IBAction func favPressed(_ sender: UIButton) {
        updateIcon(state: button ?? false)
        defaults.set(button, forKey: "\(self.idNumber.text ?? "")")
        navigationController?.popViewController(animated: true)
        delegate?.updateFavorite(indexPath: indexPath!, bool: button ?? false )
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
    private func setIcon(state: Bool){
        if state{
            favIcon.setImage(UIImage(systemName: "suit.heart.fill"), for: UIControl.State.normal)
        } else {
            favIcon.setImage(UIImage(systemName: "suit.heart"), for: UIControl.State.normal)
        }
    }
}
