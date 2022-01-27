//
//  apiCallFunctionality.swift
//  apiCalls
//
//  Created by Rave Bizz on 1/27/22.
//

import Foundation

struct JokeCall: Decodable {
    let value: String?
}

struct Drinks: Decodable{
    let drinks: [Drink]
}

struct Drink: Decodable {
    let strDrink: String?
}

struct Shows : Decodable{
    let name: String?
}

struct Show: Decodable {
    let name: String?
}
struct Feed: Decodable{
    let results: [Result]
}
struct Response: Decodable {
    let feed: Feed
}

struct Result: Decodable{
    let artistName: String?
}


