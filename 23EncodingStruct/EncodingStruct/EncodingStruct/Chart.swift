//
//  Chart.swift
//  EncodingStruct
//
//  Created by ravebizz on 2/8/22.
//

import Foundation

struct Chart: Codable {
    let type: String
    let data: DataClass
}

struct DataClass: Codable {
    let labels: [Int]
    let datasets: [Dataset]
}

struct Dataset: Codable {
    let label: String
    let data: [Int]
}
