//
//  Drinks.swift
//  apiCalls
//
//  Created by ravebizz on 1/27/22.
//

import Foundation

struct Drinks: Decodable {
    var drinks: [Drink]?
    struct Drink: Decodable {
        var strDrink: String?
        var strDrinkThumb: String?
        var idDrink: String?
    }
}
