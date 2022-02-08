//
//  Drinks.swift
//  ProtocolNetworking
//
//  Created by ravebizz on 2/8/22.
//

import Foundation

struct Drinks: Codable {
    let drinks: [Drink]
}

struct Drink: Codable {
    let strDrink: String
    let strDrinkThumb: String
    let idDrink: String
}
