//
//  Music.swift
//  apiCalls
//
//  Created by ravebizz on 1/27/22.
//

import Foundation

struct Music: Decodable {
    var feed: Feed?
    struct Feed: Decodable {
        var results: [MusicResult]?
        struct MusicResult: Decodable {
            var artistName: String?
            var name: String?
        }
    }
}
