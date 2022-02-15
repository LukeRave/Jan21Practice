//
//  ValidationService.swift
//  Project_29
//
//  Created by Rave Bizz on 2/15/22.
//

import Foundation

final class ValidationService{
    static let shared = ValidationService()
    
    func inputCheck(response: Data?) throws -> Data{
        guard let data = response else { throw ValidationError.invalidValue }
        return data
    }
}

enum ValidationError: LocalizedError{
    case invalidValue
    
    var errorDescription: String?{
        switch self{
        case .invalidValue:
            return "The value is invalid"
        }
    }
}
