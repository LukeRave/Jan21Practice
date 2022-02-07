//
//  NetworkManager.swift
//  NASAStalker
//
//  Created by Rave Training on 2/4/22.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private var apiEndpoint: String = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?"
    private var apiKey: String = "api_key=DEMO_KEY"
    private var apiParams: String = "&sol=2000&page=1"
    init() {}
    private func generateURL() -> URL {
        guard let url = URL(string: apiEndpoint + apiKey + apiParams) else {return URL(string: "https://www.google.com")!}
        return url
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
        let task = URLSession.shared.dataTask(with: self.generateURL(), completionHandler: {d,r,e in
            if let e = e { print(e.localizedDescription) }
            if let r = r as? HTTPURLResponse { if !Array(200..<300).contains(r.statusCode) { print(r.statusCode) } }
            self.parseJSONdata(d: d, completion: { model in completion(model) })
        })
        task.resume()
    }
}
