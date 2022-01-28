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
        case artistName, name
        case imageUrl = "artworkUrl100"
    }
    
    var artistName: String?
    var name: String?
    var imageUrl: String?
    
}
