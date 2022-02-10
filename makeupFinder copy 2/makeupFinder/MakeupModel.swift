//
//  MakeupModel.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import Foundation

struct MakeupModel: Codable, Equatable{
    static func == (lhs: MakeupModel, rhs: MakeupModel) -> Bool {
        if
            lhs.brand == rhs.brand &&
            lhs.name == rhs.name &&
            lhs.price == rhs.price &&
            lhs.image_link == rhs.image_link &&
            lhs.product_link == rhs.product_link &&
            lhs.description == rhs.description &&
            lhs.rating == rhs.rating &&
            lhs.product_type == rhs.product_type {
            
            return true
        }
        return false
    }
    
    let brand: String?
    let name: String?
    let price: String?
    let image_link: String?
    let product_link: String?
    let description: String?
    let rating: Float?
    let product_type: String?
}
