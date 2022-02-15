//
//  DataDecoder.swift
//  Project_29
//
//  Created by Rave Bizz on 2/13/22.
//

import Foundation

class DataDecoder{
    static let shared = DataDecoder()
    
    func decode(for data: Data) -> Response{
        var musicModel: Response?
            do{
                let model = try JSONDecoder().decode(Response.self, from: data)
                musicModel = model
            }catch{
                print(error.localizedDescription)
            }
        return musicModel ?? Response()
    }
}
