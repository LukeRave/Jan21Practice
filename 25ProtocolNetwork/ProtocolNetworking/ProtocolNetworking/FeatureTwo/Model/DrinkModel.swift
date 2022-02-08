//
//  DrinkModel.swift
//  ProtocolNetworking
//
//  Created by Rave Bizz on 2/8/22.
//

import Foundation

struct TopDrinks: Decodable{
    var drinks: [Drink]
}
struct Drink: Decodable{
    var name: String?
    var id: String?
    var imgUrl: String?
    
    enum CodingKeys: String, CodingKey{
        case name = "strDrink"
        case id = "idDrink"
        case imgUrl = "strDrinkThumb"
    }
}
