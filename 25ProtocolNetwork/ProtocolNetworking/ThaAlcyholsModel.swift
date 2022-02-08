//
//  ThaAlcyhols.swift
//  ProtocolNetworking
//
//  Created by Isaac Farr on 2/8/22.
//

import Foundation

struct ThaAlcyholsModel: Codable {
    let drinks: [Drink]
}


struct Drink: Codable {
    let strDrink: String
    let strDrinkThumb: String
    let idDrink: String
}

