//
//  NewsModel.swift
//  networkingDemo
//
//  Created by Luat on 1/27/22.
//

import Foundation

struct NewsModel: Decodable {
    let id: Int?
    let author: String?
    let title: String?
    let doesntExist: String?
}
