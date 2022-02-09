//
//  NasaResponseModels.swift
//  PersistFav
//
//  Created by Matthew Flores on 2/8/22.
//

import Foundation

struct NasaResponse: Decodable {
    let photos: [Photo]
}

struct Photo: Decodable {
    let id: Int?
    let rover: Rover?
    let img_src: String?
}

struct Rover: Decodable {
    let name: String?
}
