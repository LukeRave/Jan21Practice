//
//  Cart.swift
//  EComApp
//
//  Created by Luat on 1/26/22.
//

import Foundation


protocol CartProtocol {
    associatedtype CartItems
    var cartItems: CartItems { get set }
    func addToCart(product: ProductItem)
    func removeFromCart(product: ProductItem)
    
}

struct Cart: CartProtocol {
    typealias CartItems = [ProductItem: Int]
    var cartItems: CartItems = [:]
    
    func addToCart(product: ProductItem) {
        
    }
    
    func removeFromCart(product: ProductItem) {
        
    }
}
