//
//  NasaPhotosViewModel.swift
//  UserDefaultProject
//
//  Created by Rave Bizz on 2/6/22.
//

import Foundation
import UIKit

class NasaPhotosViewModel{
    var model: PhotosResponse?
    
    func getData(completion: @escaping () -> Void){
        NetworkManagr.shared.getData(completion: { model in
            self.model = model
            DispatchQueue.main.async{
                completion()
            }
        })
    }
}
