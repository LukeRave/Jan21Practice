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
    var photo: UIImage?
    var delegate: UpdateFavoritesProtocol?
    var row: Int?
    var rowCount: Int?
    var imgSrc: URL?
    let nasaPhotoViewModel = NasaPhotoViewModel()
    let photoCache = PhotoCache.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nasaPhotoViewModel.updateUI = {
            self.photo = self.nasaPhotoViewModel.photo
            self.nasaImageView.image = self.photo
            if let ro = self.row, let photo = self.photo {
                self.photoCache.saveImageToCache(row: ro, obj: photo)
            }
        }
        if let ro = row {
            if let photo = photoCache.loadImageFromCache(row: ro) {
                self.photo = photo
                self.nasaImageView.image = self.photo
            } else {
                if let url = imgSrc {
                    nasaPhotoViewModel.getData(url: url)
                }
            }
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(heartTapped(_:)))
        tapGesture.cancelsTouchesInView = false
        heart.addGestureRecognizer(tapGesture)
        heart.isUserInteractionEnabled = true
    }
    
    @objc func heartTapped(_ gesture: UIGestureRecognizer) {
        print("hearttapped0")
        if let ro = self.row {
            print("hearttapped1")
            delegate?.UpdateFavorites(row: ro)
        }
        dismiss(animated: true, completion: nil)
    }

    
}
