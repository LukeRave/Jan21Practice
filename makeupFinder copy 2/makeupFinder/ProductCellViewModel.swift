//
//  ProductCellViewModel.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/8/22.
//

import Foundation

class ProductCellViewModel{
    var model: MakeupModel?
    func getName() -> String? {
        model?.name
    }
    func getPrice() -> String? {
        model?.price?.formatToPrice()
    }
    
    func getRating() -> String? {
        if let rating = model?.rating{
            return StringConstants.ratingPrefix.rawValue + "\(rating)"
        }
        return nil
    }
    func getBrand() -> String? {
        model?.brand
    }
    func getPhoto() -> URL?{
        if let link = model?.image_link{
            return URL(string: link)
        }
        return nil
    }
}
