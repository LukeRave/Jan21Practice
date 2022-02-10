//
//  HomeViewModel.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/7/22.
//

import Foundation

class HomeViewModel{
    var cart: [MakeupModel]?
    var favorites: [MakeupModel]?
    var modelToSend: [MakeupModel]?
    var DM: DataManager = DataManager()
    
    func handleSearch(for text: String, handleError: @escaping (()->Void), completion: @escaping () -> Void){
        APIManger.shared.constructUrl(withqueries: text.prepareForSearch(), searchErrorHandeler: handleError)
            APIManger.shared.getData(model: MakeupModel.self, completion: {
                model in
                self.modelToSend = model
                DispatchQueue.main.async {
                    completion()
                }
            })
        }
    func getFavorites(){
        favorites = DM.getData(for: StringConstants.favoritePath.rawValue)
    }
    func getCart(){
        cart = DM.getData(for: StringConstants.cartPath.rawValue)
    }
    
    
    func addTo(atIndex index: Int, withTag tag: Int){
        switch tag{
        case 0:
            if let model = cart?[index]{
                DM.setData(with: [model], for: StringConstants.cartPath.rawValue)
            }
        case 1:
            if let model = favorites?[index]{
                DM.setData(with: [model], for: StringConstants.cartPath.rawValue)
            }
        default:
            return
        }
    }
}
