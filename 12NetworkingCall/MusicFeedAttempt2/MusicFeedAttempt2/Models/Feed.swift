//
//  Feed.swift
//  MusicFeedAttempt2
//
//  Created by ravebizz on 1/28/22.
//

import Foundation

struct Feed: Decodable {
    var feed: Response?
}

struct Response: Decodable {
    var results: [MusicItem]?
}

struct MusicItem: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case artistName, name
        case imageUrl = "artworkUrl100"
    }
    
    var artistName: String?
    var name: String?
    var imageUrl: String?
}
