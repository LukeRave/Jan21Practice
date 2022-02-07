//
//  PhotoCache.swift
//  PersistFavorites
//
//  Created by ravebizz on 2/7/22.
//

import Foundation
import UIKit

class PhotoCache {
    
    static let shared = PhotoCache()
    
    private init() {
        
    }
    
    var cache: NSCache<NSString, UIImage> = NSCache()
    
    func saveImageToCache(row: Int, obj: UIImage) {
        let keyString = NSString(format: "%d", "Photo\(row)")
        cache.setObject(obj, forKey: keyString)
    }
    
    func loadImageFromCache(row: Int) -> UIImage? {
        let keyString = NSString(format: "%d", "Photo\(row)")
        return cache.object(forKey: keyString)
    }
}
