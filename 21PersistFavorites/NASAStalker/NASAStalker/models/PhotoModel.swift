//
//  PhotoModel.swift
//  NASAStalker
//
//  Created by Rave Training on 2/4/22.
//

import Foundation

struct RoverImageFeed: Decodable {
    let photos: [RoverImageModel?]?
}
struct RoverImageModel: Decodable {
    let id: Int?
    let img_src: String?
    let earth_date: String?
    let rover: RoverModel?
    let camera: RoverCamera?
}
struct RoverModel: Decodable {
    let id: Int?
    let name: String?
}
struct RoverCamera: Decodable {
    let id: Int?
    let full_name: String?
}
