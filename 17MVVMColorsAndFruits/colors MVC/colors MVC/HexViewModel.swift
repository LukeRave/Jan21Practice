//
//  HexViewModel.swift
//  colors MVC
//
//  Created by Rave Bizz on 2/1/22.
//

import Foundation

class HexViewModel{
    var model: HexResponse?
    
    func getData(for color: String, completion: @escaping () -> Void){
        APIManager.shared.getData(for: color, completion: {
            model in
            self.model = model
            DispatchQueue.main.async{
                completion()
            }
        })
    }
    
    func getColor() -> String? {
        model?.hex?.value
    }
    
    func getName() -> String? {
        model?.name?.value
    }
    
    func getIsexactMatch() -> Bool? {
        model?.name?.isExactMatch
    }
}
