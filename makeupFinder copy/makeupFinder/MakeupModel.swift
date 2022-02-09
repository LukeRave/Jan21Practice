//
//  MakeupModel.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import Foundation

struct MakeupModel: Codable, Hashable {
    let brand: String?
    let name: String?
    let price: String?
    let image_link: String?
    let product_link: String?
    let description: String?
    let rating: Float?
    let product_type: String?
}
