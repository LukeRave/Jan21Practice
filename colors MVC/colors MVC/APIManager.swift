//
//  APIManager.swift
//  colors MVC
//
//  Created by Rave Bizz on 2/1/22.
//

import Foundation
import UIKit

final class APIManager{
    static let shared = APIManager()
    private init(){}
    func getData(for rgbraw: [CGFloat], completion: @escaping (HexResponse) -> Void){
        let rgb = rgbraw.map {Int($0*255)}
        guard let url = URL(string: Constants.baseUrl + "\(rgb[0]),\(rgb[1]),\(rgb[2])") else { return }
        print(url)
        let task = URLSession.shared.dataTask(with: url, completionHandler: { d,r,e in
            if let data = d {
                do {
                    let model = try JSONDecoder().decode(HexResponse.self, from: data)
                    completion(model)
                } catch  { print(error.localizedDescription) }
            }
        })
        task.resume()
    }
}
