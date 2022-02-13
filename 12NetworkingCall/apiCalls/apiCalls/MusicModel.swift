//
//  MusicModel.swift
//  apiCalls
//
//  Created by Cameryn Williams on 2/12/22.
//

import Foundation

struct Response: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let artistName: String?
}


