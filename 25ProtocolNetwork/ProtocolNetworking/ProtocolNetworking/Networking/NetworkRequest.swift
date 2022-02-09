
import Foundation


protocol NetworkRequest {
    associatedtype ModelType
    func decode(data: Data) -> ModelType?
    func startRequest(completion: @escaping (ModelType?) -> Void)
}

extension NetworkRequest {
    func load(url: URL, completion: @escaping (ModelType?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(self.decode(data: data))
        }.resume()
    }
}
