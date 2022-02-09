//
//  NetworkError.swift
//  ProtocolNetworking
//
//  Created by Luat on 2/8/22.
//

import Foundation

enum NetworkRequestError: Error {
    case dataNotFound
    case cannotDecodeData
    case serverError
    case unauthorized
}
