//
//  Constants.swift
//  PersistFavorites
//
//  Created by ravebizz on 2/4/22.
//

import Foundation

struct Constants {
    static let nasa_url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=DEMO_KEY&sol=2000&page=1"
    struct UserDefaultKey {
        static let favorites = "FavoritesArray"
    }
}
