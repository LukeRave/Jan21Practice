//
//  ThaAlcyholsRequest.swift
//  ProtocolNetworking
//
//  Created by Isaac Farr on 2/8/22.
//

import Foundation

struct ThaAlcyholsRequest {
    
    func getDranks(completion: @escaping (Result<[Drink], NetworkRequestError>) -> Void) {
        let request = ModelRequest(resource: ThaAlycholsResource())
        request.startRequest { model in
            guard let model = model else {
                completion(.failure(.dataNotFound))
                return
            }
            
            let drinks = model.drinks
            completion(.success(drinks))
        }
    }
}
