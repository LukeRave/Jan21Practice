//
//  NasaViewModel.swift
//  PersistFavorites
//
//  Created by ravebizz on 2/4/22.
//

import Foundation
import UIKit

class NasaFeedViewModel {
    var nasaPhotosModel: NasaFeed? {
        didSet{
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }
    
    private var network = NetworkManager.shared
    
    var updateUI: () -> Void = { }
    
    func getData() {
        network.getNasaFeedData(completion: {
            [weak self] model in
            guard let welf = self else {
                return
            }
            welf.nasaPhotosModel = model
        })
    }
}
