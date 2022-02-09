//
//  DataDecoder.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/7/22.
//

import Foundation

class DataDecoder{
    static func decodeData(for data: String) -> [MakeupModel]? {
        if let data = data.data(using: .utf8){
            do {
                let model = try JSONDecoder().decode([MakeupModel].self, from: data)
                return model
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
