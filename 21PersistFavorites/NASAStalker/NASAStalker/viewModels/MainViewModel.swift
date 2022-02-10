//
//  MainViewModel.swift
//  NASAStalker
//
//  Created by Rave Training on 2/7/22.
//

import Foundation
import UIKit

final class MainViewModel {
    static let shared = MainViewModel()
    init() {}
    func retreiveFeedData(completion: @escaping ([RoverImageModel]) -> Void) {
        NetworkManager.shared.makeRequest(completion: { data in
            guard let feed = data.photos else { return }
            let mappedFeed: [RoverImageModel] = feed.map { roverImage in
                roverImage.isFavorite = false
                return roverImage
            }
            completion(mappedFeed)
        })
    }
    func retreiveImage(strURL: String?, completion: @escaping(Data) -> Void) {
        guard let url = strURL else { return }
        NetworkManager.shared.makeIMGRequest(strURL: url, completion: { imgData in
            completion(imgData)
        })
    }
    func toggleIsFavorite(model: RoverImageModel) -> RoverImageModel {
        model.isFavorite = !(model.isFavorite ?? false)
        return model
    }
}
