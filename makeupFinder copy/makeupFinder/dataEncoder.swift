//
//  dataEncoder.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/7/22.
//

import Foundation

class DataEncoder{
    static func encodeData(for data: [MakeupModel]) -> String? {
        do {
            let encodedData = try JSONEncoder().encode(data)
            let jsonString = String(data: encodedData, encoding: .utf8)
            return jsonString
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
