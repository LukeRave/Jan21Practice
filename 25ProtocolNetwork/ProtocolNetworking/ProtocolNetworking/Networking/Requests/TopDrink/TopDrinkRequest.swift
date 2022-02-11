//
//  TopDrinkRequest.swift
//  ProtocolNetworking
//
//  Created by Rave Bizz on 2/8/22.
//

import Foundation

struct TopDrinkRequest {
    func getDrinks(completion: @escaping (Result<[Drink], NetworkRequestError>) -> Void){
        let request = ModelRequest(resource: TopDrinkResource())
        request.startRequest { model in
            guard let model = model else{
                completion(.failure(.dataNotFound))
                return
            }
            let drinks = model.drinks
            completion(.success(drinks))
        }
    }
}
