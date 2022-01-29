//
//  model.swift
//  listMusic
//
//  Created by Rave Bizz on 1/29/22.
//

import Foundation

struct Feed: Decodable {
    let results: [Result]
}

struct Response: Decodable{
    let feed: Feed?
}

struct Result: Decodable {
    enum CodingKeys: String, CodingKey {
        case artistName, name
        case imageUrl = "artworkUrl100"
    }
    
    let artistName: String?
    let name: String?
    let imageUrl: String?
}
