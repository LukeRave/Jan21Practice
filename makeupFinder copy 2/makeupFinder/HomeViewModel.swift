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
    
    func handleSearch(for text: String, handleError: @escaping (()->Void), completion: @escaping () -> Void){
        if text == "Clear" || text == "clear" || text == "CLEAR"{
            let emptyArr: [MakeupModel] = []
            favorites = emptyArr
            cart = emptyArr
        } else{
            do{
            APIManger.shared.constructUrl(withqueries: text.prepareForSearch(), searchErrorHandeler: handleError)
            APIManger.shared.getData(model: MakeupModel.self, completion: {
                model in
                self.modelToSend = model
                DispatchQueue.main.async {
                    completion()
                }
            })
            }catch{
                print(error)
            }
        }
    }
    func getFavorites(){
        favorites = DataManager.shared.getData(for: StringConstants.favoritePath.rawValue)
        
    }
    func getCart(){
        cart = DataManager.shared.getData(for: StringConstants.cartPath.rawValue)
    }
    
    
    func addTo(atIndex index: Int, withTag tag: Int){
        switch tag{
        case 0:
            if let model = cart?[index]{
                DataManager.shared.setData(with: [model], for: StringConstants.cartPath.rawValue)
            }
        case 1:
            if let model = favorites?[index]{
                DataManager.shared.setData(with: [model], for: StringConstants.cartPath.rawValue)
            }
        default:
            return
        }
    }
}
