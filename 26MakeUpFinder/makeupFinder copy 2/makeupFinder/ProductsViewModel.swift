//
//  ProductsViewModel.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/7/22.
//

import Foundation

class ProductsViewModel{
    var makeupModel: [MakeupModel]?
    
    func addToFavorites(atIndex index: Int){
        if let model = makeupModel?[index] {
            .shared.setData(with: [model], for: StringConstants.favoritePath.rawValue)
        }
    }
    
    func addToCart(atIndex index: Int){
        if let model = makeupModel?[index]{
            .shared.setData(with: [model], for: StringConstants.cartPath.rawValue)
        }
    }
    
    func setFavorites(){
        self.makeupModel = .shared.getData(for: StringConstants.favoritePath.rawValue)
    }
}
