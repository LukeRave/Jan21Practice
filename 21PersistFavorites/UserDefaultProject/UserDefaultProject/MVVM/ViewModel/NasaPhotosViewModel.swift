//
//  NasaPhotosViewModel.swift
//  UserDefaultProject
//
//  Created by Rave Bizz on 2/6/22.
//

import Foundation
import UIKit

class NasaPhotosViewModel{
    var model: PhotosResponse? {
        didSet{
            DispatchQueue.main.async{
                self.updateUI(self.model)
            }
        }
    }
    
    var network = NetworkManagr()
    var updateUI: (PhotosResponse?) -> Void = { _ in }
    func updateData() {
        network.getData { model in
            self.model = model
        }
    }

}
