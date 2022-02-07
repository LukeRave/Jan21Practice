//
//  PhotoViewController.swift
//  PersistFavorites
//
//  Created by ravebizz on 2/7/22.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var nasaImageView: UIImageView!
    @IBOutlet weak var heart: UIImageView!
    var photos: [Int:UIImage]?
    var nasaTableDelegate: UpdateFavoritesProtocol?
    var row: Int?
    var imgSrc: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector(("heartTapped:")))
        
        heart.addGestureRecognizer(tapGesture)
        heart.isUserInteractionEnabled = true
    }

    func heartTapped(gesture: UIGestureRecognizer) {
        print("heart tapped")
    }

    
}
