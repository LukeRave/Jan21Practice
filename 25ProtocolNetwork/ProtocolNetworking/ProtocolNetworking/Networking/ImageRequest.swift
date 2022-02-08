
import UIKit

class ImageRequest {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
}

extension ImageRequest: NetworkRequest {
    
    func decode(data: Data) -> UIImage? {
        return UIImage(data: data)
    }
    
    func startRequest(completion: @escaping (UIImage?) -> Void) {
        load(url: url, completion: completion)
    }
}
