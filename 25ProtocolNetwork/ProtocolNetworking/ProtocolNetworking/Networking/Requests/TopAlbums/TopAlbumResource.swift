//
//  FeedResource.swift
//  ProtocolNetworking
//
//  Created by Luat on 2/7/22.
//

import Foundation


/// API: https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json

struct TopAlbumResource: AnyResource {
    typealias ModelType = TopAlbums
    var url: URL
    
    init() {
        let resourceString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        self.url = resourceURL
    }
}
