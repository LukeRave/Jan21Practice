//
//  TaskManager.swift
//  UserDefaultProject
//
//  Created by Rave Bizz on 2/6/22.
//

import Foundation

struct PhotosResponse: Decodable{
    let photos: [Photo]
    
}

struct Photo: Decodable {
    let imgUrl: String?
    let id: Int?
    let date: Int?
    enum CodingKeys: String, CodingKey{
        case imgUrl = "img_src"
        case id
        case date = "earth_date"
    }
}

//struct Rover: Decodable {
//    let name: String?
//}
