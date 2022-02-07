//
//  NasaPhotoViewModel.swift
//  PersistFavorites
//
//  Created by ravebizz on 2/7/22.
//

import Foundation
import UIKit

struct NasaPhotoViewModel {
    var photos: [UIImage]?
    var photo: UIImage?
    
    private var network = NetworkManager.shared
    
    func getData(url: URL) {
        network.getNasaPhoto(completion: {
            [weak self] model in
            guard let welf = self else {
                return
            }
            welf.photo = model
        })
    }
}
