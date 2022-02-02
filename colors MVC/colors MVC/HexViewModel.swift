//
//  HexViewModel.swift
//  colors MVC
//
//  Created by Rave Bizz on 2/1/22.
//

import Foundation

class HexViewModel{
    var model: HexResponse?
    
    func getData(for hex: String, completion: @escaping () -> Void){
        if let url = URL(string: "\(Constants.baseUrl)\(hex)") {
            APIManager.shared.getData(url: url, completion:{
                model in
                self.model = model
                DispatchQueue.main.async {
                    completion()
                }
            })
        }
    }
    
    func getColor() -> String {
        model?.hex?.value ?? ""
    }
    
    func getName() -> String {
        model?.name?.value ?? ""
    }
    
    func getIsExactMatch() -> Bool {
        model?.name?.isExactMatch ?? false
    }
}
