import UIKit

var greeting = "Hello, playground"

//<T>

func myConcat<T>(first: T, second: T) -> [T] {
    return [first, second]
}

let myValue = myConcat(first: "asdf", second: "opwieqr")
let myInts = myConcat(first: 1, second: 200)

var myInt: Int = 0

func start<T>(completion: (T) -> Void) {
}

start { someT in
    myInt = someT
}

func fetchData<T: Decodable>(str: String, completion: @escaping (T) -> Void) {
    guard let url = URL(string: str) else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else {
            return
        }
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            completion(decoded)
        } catch {}
    }.resume()
}

struct Music: Decodable {
}
var myMusic: Music?
fetchData(str: "asdf") { decoded in
    myMusic = decoded
}

