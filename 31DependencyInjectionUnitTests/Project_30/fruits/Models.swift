//
//  Models.swift
//  fruits
//
//  Created by Rave Bizz on 2/1/22.
//

import Foundation

struct Fruit: Decodable{
    let name: String?
    let nutritions: Nutrition?
}

struct Nutrition: Decodable{
    let protein: Float?
    let fat: Float?
    let calories: Int?
    let sugar: Float?
}
