//
//  MainViewModel.swift
//  NASAStalker
//
//  Created by Rave Training on 2/7/22.
//

import Foundation

final class MainViewModel {
    static let shared = MainViewModel()
    init() {}
    func retreiveFeedData(completion: () -> Void) {
        NetworkManager.shared.makeRequest(completion: { data in
            guard let feed = data.photos else { return }
            feed.forEach { print($0) }
        })
    }
    func retreiveImage(strURL: String?, completion: (Data) -> Void) {
        guard let url = strURL else { return }
        NetworkManager.shared.makeIMGRequest(strURL: url, completion: {imgData in
            completion(imgData)
        })
    }
}
