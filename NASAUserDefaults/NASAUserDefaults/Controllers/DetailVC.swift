//
//  DetailVC.swift
//  NASAUserDefaults
//
//  Created by Isaac Farr on 2/5/22.
//

import UIKit
import CoreData

class DetailVC: UIViewController {
    
    
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var spaceStuff: UIImageView!
    
    var spaceImage: String?
    var delegate: FavoriteUpdateDelegate?
    
    var newFavoriteId: Int?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
    
    @IBAction func favoriteButton(_ sender: UIButton) {
        let newFavorite = Favorite(context: self.context)
        newFavorite.id = Int32(newFavoriteId ?? 0)
        delegate?.addFavorite(favorite: newFavorite)
        dismiss(animated: true, completion: nil)
    }
    
}
