//
//  MusicModel.swift
//  displayMusicList
//
//  Created by Rave Training on 1/27/22.
//

import Foundation

struct AlbumData: Decodable {
    enum CodingKeys: String, CodingKey {
        case artistName
        case imageUrl = "artworkUrl100"
        case albumName = "name"
    }
    let artistName: String?
    let albumName: String?
    let imageUrl: String?
}
struct MusicFeedData: Decodable {
    let title: String?
    let results: [AlbumData]?
}
struct MusicFeed: Decodable {
    let feed: MusicFeedData?
}
