//
//  ThaAlcyholsResource.swift
//  ProtocolNetworking
//
//  Created by Isaac Farr on 2/8/22.
//

import Foundation

struct ThaAlycholsResource: AnyResource {
    typealias ModelType = ThaAlcyholsModel
    var url: URL
    
    init(){
        
        let resourceString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        self.url = resourceURL;
    }
}
