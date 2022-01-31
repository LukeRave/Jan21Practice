//
//  AlbumsModel.swift
//  apiCalls
//
//  Created by Isaac Farr on 1/31/22.
//

import Foundation

struct AlbumsModel: Decodable {
    var feed: AlbumFeed?
}
struct AlbumFeed: Decodable {
    var results: [Result?]?
}
struct Result: Decodable {
    var artistName: String?
}
