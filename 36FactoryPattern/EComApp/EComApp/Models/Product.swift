//
//  Product.swift
//  EComApp
//
//  Created by Luat on 1/26/22.
//

import Foundation

protocol Product: Hashable {
    var productID: Int { get }
    var name: String { get set }
}

struct ProductItem: Product {
    let productID: Int
    var name: String
}
