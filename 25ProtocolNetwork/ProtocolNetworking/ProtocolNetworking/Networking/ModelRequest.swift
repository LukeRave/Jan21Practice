
import Foundation

class ModelRequest<Resource: AnyResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension ModelRequest: NetworkRequest {
    func decode(data: Data) -> Resource.ModelType? {
        return try? JSONDecoder().decode(Resource.ModelType.self, from: data)
    }
    
    func startRequest(completion: @escaping (Resource.ModelType?) -> Void) {
        load(url: resource.url, completion: completion)
    }
}
