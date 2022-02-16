
import Foundation

struct TopAlbumRequest {
    
    func getAlbums(completion: @escaping (Result<[MusicItem], NetworkRequestError>) -> Void) {
        let request = ModelRequest(resource: TopAlbumResource())
        request.startRequest { model in
            guard let model = model else {
                completion(.failure(.dataNotFound))
                return
            }
            let albums = model.feed.results
            completion(.success(albums))
        }
 
    }
}

