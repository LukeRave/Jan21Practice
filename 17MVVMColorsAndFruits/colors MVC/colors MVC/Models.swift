//
//  Models.swift
//  colors MVC
//
//  Created by Rave Bizz on 2/1/22.
//

import Foundation

struct HexResponse: Decodable {
    let hex: HexDecimal?
    let name: Name?
}
struct Name: Decodable{
    enum CodingKeys: String,CodingKey{
        case value
        case isExactMatch = "exact_match_name"
    }
    let value: String?
    let isExactMatch: Bool?
}
struct HexDecimal: Decodable {
    let value: String?
}
