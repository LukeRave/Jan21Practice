//
//  ImageViewController.swift
//  UserDefaultProject
//
//  Created by Rave Bizz on 2/7/22.
//

import UIKit

class ImageViewController: UIViewController {
    static let idetifier = String(describing: ImageViewController.self)
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var idNumber: UILabel!
    
    var image = UIImage()
    var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.img.image = image
        idNumber.text = String(describing: id)
    }
    
    @IBAction func favPressed(_ sender: UIButton) {
        
    }

}
//var imageViewController: ImageViewController {
//    let st = UIStoryboard(name: "Main", bundle: nil)
//    let vc = st.instantiateViewController(withIdentifier: ImageViewController.idetifier) as? ImageViewController
//    return vc ?? ImageViewController()
//}
