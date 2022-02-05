//
//  ViewModel.swift
//  fruits
//
//  Created by Rave Bizz on 2/1/22.
//

import Foundation

class ViewModel{
    var model: Fruit?
    
    func getData(for fruit: String, completion: @escaping () -> Void){
        APIManager.shared.getData(for: fruit, completion:{
            model in
            self.model = model
            DispatchQueue.main.async {
                completion()
            } 
        })
    }
    
    func getName() -> String? {
        model?.name
        
    }
    
    func getFat() -> String {
        String(model?.nutritions?.fat ?? 0)
    }
    
    func getCalories() -> String {
        String(model?.nutritions?.calories ?? 0)
    }
    
    func getSugar() -> String {
        String(model?.nutritions?.sugar ?? 0)
    }
    
    func getProtien() -> String {
        String(model?.nutritions?.protein ?? 0)
    }
}
