//
//  PhotoViewController.swift
//  PersistFavorites
//
//  Created by ravebizz on 2/7/22.
//

import UIKit

class PhotoViewController: UIViewController, UIGestureRecognizerDelegate {

    let identifier = "PhotoView"
    @IBOutlet weak var nasaImageView: UIImageView!
    @IBOutlet weak var heart: UIImageView!
    var photos: [Int:UIImage]?
    var delegate: UpdateFavoritesProtocol?
    var row: Int?
    var imgSrc: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(heartTapped(_:)))
        tapGesture.cancelsTouchesInView = false
        heart.addGestureRecognizer(tapGesture)
        heart.isUserInteractionEnabled = true
    }
    
    @objc func heartTapped(_ gesture: UIGestureRecognizer) {
        print("heart tapped")
    }

    
}
