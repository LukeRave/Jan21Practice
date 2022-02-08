//
//  Constants.swift
//  PersistFav
//
//  Created by Matthew Flores on 2/7/22.
//

import Foundation

struct Const {
    static let url = URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=AC8aYkPErfyrhZQXflNmhbH2nvXKrKUlkBohe1dX&sol=2000&page=1")
    static let cellID = "cell"
    static let apiKey = "AC8aYkPErfyrhZQXflNmhbH2nvXKrKUlkBohe1dX"
    static var list: [Photo] = []
}
