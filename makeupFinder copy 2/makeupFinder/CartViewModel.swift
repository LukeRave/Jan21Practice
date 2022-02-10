//
//  CartViewModel.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/7/22.
//

import Foundation

class CartViewModel{
    var cart: [MakeupModel]?
    init(){
        getCart()
    }
    
    let dataGetter: DataGetter = DataManager()
    let dataSetter: DataSetter = DataManager()
    
    func getCart(){
        cart = dataGetter.getData(for: StringConstants.cartPath.rawValue)
    }
    
    func getTotal() -> String{
        var total = 0.0
        if let cart = cart {
            for makeup in cart{
                if let price = makeup.price{
                    total += Double(price) ?? 0.0
                }
            }
        }
        return "\(total)".formatToPrice()
    }
    
    func addToFavorites(atIndex index: Int){
        if let model = cart?[index] {
            dataSetter.setData(with: [model], for: StringConstants.favoritePath.rawValue)
        }
    }
}
