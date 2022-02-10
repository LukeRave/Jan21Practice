//
//  ProductsViewModel.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/7/22.
//

import Foundation

class ProductsViewModel{
    var makeupModel: [MakeupModel]?
    var DM: DataManager = DataManager()
    func addToFavorites(atIndex index: Int){
        if let model = makeupModel?[index] {
            DM.setData(with: [model], for: StringConstants.favoritePath.rawValue)
        }
    }
    
    func addToCart(atIndex index: Int){
        if let model = makeupModel?[index]{
            DM.setData(with: [model], for: StringConstants.cartPath.rawValue)
        }
    }
    
    func setFavorites(){
        self.makeupModel = DM.getData(for: StringConstants.favoritePath.rawValue)
    }
}
