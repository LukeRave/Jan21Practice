import Foundation
import UIKit

struct Chart: Encodable {
    let type: String
    let data: ChartData
}
struct ChartData: Encodable {
    let labels: [Int]
    let datasets: [ChartDataset]
}
struct ChartDataset: Encodable {
    let label: String
    let data: [Int]
}
struct NetworkManager {
    static var shared = NetworkManager()
    private var components = URLComponents()
    init() {
        components.scheme = "https"
        components.host = "quickchart.io"
        components.path = "/chart"
    }
    private mutating func constructURL(data: Chart) {
        let encodedChart = try? JSONEncoder().encode(data)
        guard let encodedChart = encodedChart else { return }
        let chartQuery = String(data: encodedChart, encoding: .utf8)
        components.queryItems = [URLQueryItem(name: "c", value: chartQuery)]
    }
    mutating func makeRequest(data: Chart, completion: @escaping(Data) -> Void) {
        constructURL(data: data)
        guard let url = components.url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { d, r, e in
            if let d = d { completion(d) }
        }
        task.resume()
    }
}

let testChart: Chart = Chart(type: "bar", data: ChartData(labels: Array(2012...2016), datasets: [
    ChartDataset(label: "Users", data: [120,60,50,180,1200])
]))

NetworkManager.shared.makeRequest(data: testChart, completion: {data in
    guard let chartImage = UIImage(data: data) else { return }
    print(chartImage)
})
