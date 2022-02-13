//
//  MusicModel.swift
//  Project_29
//
//  Created by Rave Bizz on 2/11/22.
//

import Foundation

struct Response:Decodable{
    var feed: Feed?
}
struct Feed:Decodable{
var results:[Album]?
}
struct Album:Decodable {
    var artistName: String?
    var name: String?
    var imgUrl: String?
    
    enum CodingKeys: String, CodingKey{
        case artistName, name
        case imgUrl = "artworkUrl100"
    }
}
