//
//  MusicModel.swift
//  TableWithImageCell
//
//  Created by Luat on 1/28/22.
//

import Foundation

struct FeedResponse: Decodable {
    let feed: FeedModel?
}

struct FeedModel: Decodable {
    let title: String?
    let results: [AlbumModel]?
}

struct AlbumModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case artistName, name
        case imageUrl = "artworkUrl100"
    }
    
    let artistName: String?
    let name: String?
    let imageUrl: String?
    
}
