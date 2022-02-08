//
//  DrinkRequest.swift
//  ProtocolNetworking
//
//  Created by ravebizz on 2/8/22.
//

import Foundation

struct DrinkRequest {
    
    func getDrinks(completion: @escaping (Result<[Drink], NetworkRequestError>) -> Void) {
        let request = ModelRequest(resource: DrinkResource())
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
