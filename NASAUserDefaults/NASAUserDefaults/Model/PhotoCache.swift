//
//  FavoriteCache.swift
//  NASAUserDefaults
//
//  Created by Isaac Farr on 2/6/22.
//

import Foundation

import UIKit

class PhotoCache: NSCache<NSString, UIImage> {
    
    static let shared = PhotoCache()
    
    func cache(_ photo: UIImage, for key: String){
        let keyString = NSString(format: "%d", key)
        self.setObject(photo, forKey: keyString)
    }
    
    func getPhoto(for key: String) -> UIImage? {
        let keyString = NSString(format: "%d", key)
        let photo = self.object(forKey: keyString)
        return photo
    }
}
