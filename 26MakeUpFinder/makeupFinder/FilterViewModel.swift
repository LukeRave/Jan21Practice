//
//  FilterViewModel.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/4/22.
//

import Foundation

class FilterViewModel{
    var makeupModel: [MakeupModel]?
    func searchByTag(params: [String], completion: @escaping () -> Void){
        APIManger.shared.constructUrl(withqueries: params)
        APIManger.shared.getData(model: MakeupModel.self, completion: {
            model in
            self.makeupModel = model
            DispatchQueue.main.async {
                completion()
            }
        })
    }
}
