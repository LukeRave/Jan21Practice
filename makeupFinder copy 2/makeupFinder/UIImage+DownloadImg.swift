//
//  UIImage+DownloadImg.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/7/22.
//

import Foundation
import UIKit

extension UIImageView{
    func getImage(for url: URL){
        if let cachedImage = ImageCacheManager.shared.imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
                   self.image = cachedImage
               } else {
                   URLSession.shared.dataTask(with: url) { data, response, error in
                       guard let data = data, error == nil else { return }
                       DispatchQueue.main.async {
                           if let imageToCache = UIImage(data: data){
                               ImageCacheManager.shared.imageCache.setObject(imageToCache, forKey: url.absoluteString as NSString)
                               self.image = imageToCache
                           }
                       }
                   }.resume()
               }
           }
    }
