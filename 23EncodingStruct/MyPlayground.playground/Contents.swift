import UIKit
import Foundation

var greeting = "Hello, playground"


struct Person: Encodable {
    let name: String
    let age: Int
}

let bob = Person(name: "Bob", age: 100)

let encode = try? JSONEncoder().encode(bob)
//print(encode)

//if let url = URL(string: "example.com") {
//    var request = URLRequest(url: url)
//
//    request.httpMethod = "POST"
//    request.httpBody = encode
//
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//        guard let data = data else {
//            return
//        }
//
//    }
//    task.resume()
//}


var components = URLComponents()


/// https://quickchart.io/chart?c={json}
/// Go to https://quickchart.io/ for documentation

components.scheme = "https"
components.host = "quickchart.io"
components.path = "/chart"

let firstQuery = URLQueryItem(name: "char", value: "naruto")
components.queryItems = [firstQuery]

print(components.url)


//https://quickchart.io/chart?c={type:'line',data:{labels:[2012,2013,2014,2015,2016],datasets:[{label:'Users',data:[120,60,50,180,1200]}]}}

//https://quickchart.io/chart?c=%7B%22type%22:%22bar%22,%22data%22:%7B%22labels%22:%5B2012,2013,2014,2015,2016%5D,%22datasets%22:%5B%7B%22label%22:%22Users%22,%22data%22:%5B120,60,50,180,120%5D%7D%5D%7D%7D





