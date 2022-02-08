//
//  NetworkManager.swift
//  EncodingHTTPRequests
//
//  Created by Isaac Farr on 2/7/22.
//

import Foundation
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private var urlComponents = URLComponents()
    
    private var urlWithJson = URL(string: "https://quickchart.io/chart?c={type:%27bar%27,data:{labels:[2012,2013,2014,2015,2016],datasets:[{label:%27Users%27,data:[0,0,0,0,0]}]}}")
    
    init(scheme: String = "https", host: String = "quickchart.io", path: String = "/chart"){
        
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
    }
    
    func getRequest(with data: BarChartModel, completion: @escaping(Data) -> Void){
        encodeQueryItem(using: data)
        
        guard let safeUrl = urlWithJson else { return }
        var urlRequest = URLRequest(url: safeUrl)
        
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
            
            let httpResponse = response as! HTTPURLResponse

            let type = httpResponse.allHeaderFields["Content-Type"]
            print("Content-Type", type)

            print(httpResponse.statusCode)

        
            if let data = data { completion(data) }
        }.resume()
    }
    
    private func encodeQueryItem (using data: BarChartModel) {
        let barChart = try? JSONEncoder().encode(data)
        if let encodedChart = barChart {
            
            var queries: [URLQueryItem] = []
            
            let urlQuery = URLQueryItem(name: "c", value: String(data: encodedChart, encoding: .utf8))
            queries.append(urlQuery)
            
            urlComponents.queryItems = queries
            guard let url = urlComponents.url else { return }
            urlWithJson = url
        }
    }
}




