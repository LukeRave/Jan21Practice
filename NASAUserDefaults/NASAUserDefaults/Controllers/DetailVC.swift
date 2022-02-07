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
    
    var spaceImage: Photo?
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
        let url = URL(string: spaceImage?.imgSrc ?? "")
        if let cachedPhoto = PhotoCache.shared.getPhoto(for: spaceImage?.imgSrc ?? "") {
            print("Photo called from cache")
            spaceStuff.image = cachedPhoto
        } else {
        guard let data = try? Data(contentsOf: url!) else { return }
        guard let newCachedImage = UIImage(data: data) else { return }
            PhotoCache.shared.cache(newCachedImage, for: spaceImage?.imgSrc ?? "")
        spaceStuff.image = newCachedImage
        }
    }
    
    @IBAction func favoriteButton(_ sender: UIButton) {
        let favoriteId = Int32(newFavoriteId ?? 0)
        delegate?.addFavorite(favoriteId: favoriteId)
        dismiss(animated: true, completion: nil)
    }
    
}
