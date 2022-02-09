//
//  NetworkManager.swift
//  NASAStalker
//
//  Created by Rave Training on 2/4/22.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private var mainComponents = URLComponents()
    private var imagComponents = URLComponents()
    init() {
        mainComponents.scheme = "https"
        imagComponents.scheme = "https"
        mainComponents.host = "api.nasa.gov"
        imagComponents.host = "mars.jpl.nasa.gov"
        mainComponents.path = "/mars-photos/api/v1/rovers/curiosity/photos"
        mainComponents.queryItems = [
            URLQueryItem(name: "api_key", value: "MjrhnmhHqr81gSbovhD3izcv4MIZZycbcteHB9di"),
            URLQueryItem(name: "sol", value: "2000"),
            URLQueryItem(name: "page", value: "1")
        ]
    }
    private func generateImageURL(strURL: String?) {
        guard let strURL = strURL else { return }
        imagComponents.path = "/" + strURL.split(separator: "/").dropFirst(2).joined(separator: "/")
    }
    private func parseJSONdata(d: Data?, completion: @escaping (RoverImageFeed) -> Void) {
        if let d = d {
            do {
                let model = try JSONDecoder().decode(RoverImageFeed.self, from: d)
                completion(model)
            } catch { print(error.localizedDescription)}
        }
    }
    func makeRequest(completion: @escaping (RoverImageFeed) -> Void) -> Void {
        guard let url = mainComponents.url else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: {d,r,e in
            if let e = e { print(e.localizedDescription) }
            if let r = r as? HTTPURLResponse { if !Array(200..<300).contains(r.statusCode) { print(r.statusCode) } }
            self.parseJSONdata(d: d, completion: { model in completion(model) })
        })
        task.resume()
    }
    func makeIMGRequest(strURL: String, completion: @escaping (Data) -> Void) {
        generateImageURL(strURL: strURL)
        guard let url = imagComponents.url else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: {d,r,e in
            if let e = e { print(e.localizedDescription)}
            if let r = r as? HTTPURLResponse { if !Array(200..<300).contains(r.statusCode) { print(r.statusCode) } }
            if let d = d { completion(d) }
        })
        task.resume()
    }
}
