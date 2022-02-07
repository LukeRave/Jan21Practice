//
//  NasaPhotoViewModel.swift
//  PersistFavorites
//
//  Created by ravebizz on 2/7/22.
//

import Foundation
import UIKit

class NasaPhotoViewModel {
    var photos: [Int:UIImage?]?
    var photo: UIImage? {
        didSet{
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }
    private var network = NetworkManager.shared
    
    var updateUI: () -> Void = { }
 
    func getData(url: URL) {
        network.getNasaPhoto(url: url, completion: {
            [weak self] image in
            guard let welf = self else {
                return
            }
            welf.photo = image
        })
    }
}
