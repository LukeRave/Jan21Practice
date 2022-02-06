//
//  DetailVC.swift
//  NASAUserDefaults
//
//  Created by Isaac Farr on 2/5/22.
//

import Foundation
import UIKit

class DetailVC: UIViewController {
    
    var spaceImage: String?
    
    @IBOutlet weak var spaceStuff: UIImageView!
    
    var delegate: FavoriteUpdateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        DispatchQueue.main.async {
            self.fetchImage()
        }
    }
            
    func fetchImage(){
        let url = URL(string: spaceImage ?? "")
        guard let data = try? Data(contentsOf: url!) else { return }
        spaceStuff.image = UIImage(data: data)
    }
}
