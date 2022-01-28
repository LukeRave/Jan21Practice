//
//  Music.swift
//  SongList
//
//  Created by ravebizz on 1/28/22.
//

import Foundation

struct Music: Decodable {
    var feed: Feed?
    
}

struct Feed: Decodable {
    var results: [MusicResult]?
    
}

struct MusicResult: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case artistName, name
        case imageUrl = "artworkUrl100"
    }
    
    var artistName: String?
    var name: String?
    var imageUrl: String?
}
