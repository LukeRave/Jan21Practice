import UIKit

var greeting = "Hello, playground"

//<T>
// MARK: - Generic Functions
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

// MARK: - Generic Structs
struct Person<T> {
    var value: T
}

let bob = Person(value: 100)
let bobby = Person(value: bob)

// MARK: - Typealias
typealias UniqueAndCompared = Hashable & Comparable

var productId: (Int, String, Bool) = (1, "name", true)
typealias ProductInv = (Int, String, Bool)
var productTwo: ProductInv = (1, "name", true)


var imageClosure: (UIImage?) -> Void
typealias ImageCompletion = ((UIImage?) -> Void) -> Void

func getImage(completion: ImageCompletion) {
    completion({ _ in })
}

// MARK: - Generic Protocol
protocol Networking {
    associatedtype ModelType
    func getModel(completion: (ModelType) -> Void)
}

struct SongModel: Decodable {}

class NetworkManager: Networking {
    typealias ModelType = SongModel
    func getModel(completion: (ModelType) -> Void) {
        let model = ModelType()
        completion(model)
    }
}

let network = NetworkManager()
network.getModel { model in
    print(model)
}


// MARK: -- Result Type
enum NetworkingError: Error {
    case dataNotFound
    case unauthorized
}
func getStr(completion: (Result<String?, NetworkingError>) -> Void) {
    let downloadedStr = "asdf"
    completion(Result.failure(.dataNotFound))
    completion(Result.success(downloadedStr))
}

getStr { result in
    switch result {
    case .success(let value):
        print(value!)
    case .failure(let error):
        print(error)
    }
}
