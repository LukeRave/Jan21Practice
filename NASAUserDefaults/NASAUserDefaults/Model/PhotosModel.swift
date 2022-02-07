//
//  PhotosModel.swift
//  NASAUserDefaults
//
//  Created by Isaac Farr on 2/5/22.
//

import Foundation

struct PhotosModel: Codable {
    let photos: [Photo]?
}

class Photo: Codable, NSDiscardableContent {
    func beginContentAccess() -> Bool {
        true
    }
    
    func endContentAccess() {
    }
    
    func discardContentIfPossible() {
    }
    
    func isContentDiscarded() -> Bool {
        true
    }
    
  
    
    let id: Int
    let imgSrc: String

    enum CodingKeys: String, CodingKey {
        case id
        case imgSrc = "img_src"
    }
}



