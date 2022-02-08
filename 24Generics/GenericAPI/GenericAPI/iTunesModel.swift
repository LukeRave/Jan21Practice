//
//  iTunesModel.swift
//  tableViewCell
//
//  Created by Luat on 12/27/21.
//

import Foundation

struct iTune: Encodable & Decodable {
    let feed: Feed
}

struct Feed: Codable {
    let title: String?
    let results: [MusicItem]
}

struct MusicItem: Codable {
    let artistName: String?
    let artworkUrl100: String?
    let name: String?
}
