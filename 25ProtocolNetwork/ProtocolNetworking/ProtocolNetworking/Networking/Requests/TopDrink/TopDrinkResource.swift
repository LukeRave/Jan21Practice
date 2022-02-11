//
//  TopDrinkResource.swift
//  ProtocolNetworking
//
//  Created by Rave Bizz on 2/8/22.
//

import Foundation


/// API: https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin

struct TopDrinkResource: AnyResource {
    typealias ModelType = TopDrinks
    var url: URL
    
    init() {
        let resourceString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        self.url = resourceURL
    }
}
