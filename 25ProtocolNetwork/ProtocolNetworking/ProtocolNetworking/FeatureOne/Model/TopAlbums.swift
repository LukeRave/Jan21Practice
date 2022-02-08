//
//  FeedModel.swift
//  ProtocolNetworking
//
//  Created by Luat on 2/7/22.
//

import Foundation

struct TopAlbums: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String?
    let results: [MusicItem]
}

struct MusicItem: Decodable {
    let artistName: String?
    let artworkUrl100: String?
    let name: String?
}
