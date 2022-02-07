//
//  NasaModel.swift
//  PersistFavorites
//
//  Created by ravebizz on 2/4/22.
//

import Foundation

struct NasaFeed: Decodable {
    var photos: [Photo]?
}

struct Photo: Decodable {
    var id: Int?
    var img_src: String?
}
