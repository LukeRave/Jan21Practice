//
//  Inventory.swift
//  EComApp
//
//  Created by Luat on 1/26/22.
//

import Foundation

protocol InventoryProtocol {
    associatedtype ProductList
    static func createProducts() -> ProductList
    static func createProduct(productId: Int) -> ProductItem
    func addProduct()
    func removeProduct()
}

class Inventory: CustomStringConvertible {
    typealias ProductList = [Int: ProductItem]
    var products: ProductList = [:]
    var productCounts: [Int: Int] = [:]
    
    static func createInventory() -> Inventory {
        var result: ProductList = [:]
        for num in 0..<10 {
            let product = createProduct(productId: num)
            result[num] = product
        }
        let inventory = Inventory()
        inventory.products = result
        return inventory
    }
    
    /// Note: Factory method to create instances easier
    static func createProduct(productId: Int) -> ProductItem {
        let alpha = "abcdefghijklmnopqrstuvwxyz"
        var name = ""
        for _ in 0...5 {
            let random = Int.random(in: 0...25)
            let index = alpha.index(alpha.startIndex, offsetBy: random)
            name.append(alpha[index])
        }
        return ProductItem(productID: productId, name: name)
    }
    
    var description: String {
        var result = ""
        for (key, value) in products {
            let name = value.name
            let id = key
            let count = productCounts[key]
            result.append("ID: \(id) \nName: \(name) \nCount: \(count ?? 0)\n\n")
        }
        return result
    }
    
    func fillCount() {
        for (id, product) in products {
            productCounts[id] = 2
        }
    }
    
    func addProduct() {
        
    }
    
    func removeProduct() {
        
    }
    
    func hasItem() -> Bool {
        return false
    }
    
    func canFulfill(order: Cart) -> Bool {
        
        return false
    }
    
}
