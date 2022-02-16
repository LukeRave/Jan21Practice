//
//  Feed.swift
//  MusicFeedTable
//
//  Created by ravebizz on 1/28/22.
//

import Foundation

struct FeedResponse: Decodable {
    var feed: FeedModel?
}

struct FeedModel: Decodable {
    var results: [AlbumModel]?
}

struct AlbumModel: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case artistName, name, genres, releaseDate
        case imageUrl = "artworkUrl100"
    }
    
    var artistName: String?
    var releaseDate: String?
    var name: String?
    var imageUrl: String?
    let genres: [Genre]
    
}

struct Genre: Decodable {
    let name: Name?
}

enum Name: String, Decodable {
    case hipHopRap = "Hip-Hop/Rap"
    case music = "Music"
    case rBSoul = "R&B/Soul"
    case soundtrack = "Soundtrack"
}
