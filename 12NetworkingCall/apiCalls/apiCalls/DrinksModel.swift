//
//  DrinkModel.swift
//  apiCalls
//
//  Created by Isaac Farr on 1/30/22.
//

import Foundation

struct DrinksModel: Decodable {
    var drinks: [Drink]?
}
struct Drink: Decodable {
    var strDrink: String?
}
