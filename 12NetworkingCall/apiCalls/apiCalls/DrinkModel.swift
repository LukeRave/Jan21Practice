//
//  DrinkModel.swift
//  apiCalls
//
//  Created by Cameryn Williams on 2/12/22.
//

import Foundation

struct DrinkModel: Decodable {
    let drinks: [Drink]
}

struct Drink: Decodable {
    let strDrink: String?
}
