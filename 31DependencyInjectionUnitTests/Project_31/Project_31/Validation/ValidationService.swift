//
//  ValidationService.swift
//  Project_31
//
//  Created by Rave Bizz on 2/15/22.
//

import Foundation

struct ValidationService{
    func checkUserName(username: String?) throws -> String{
        guard let username = username else {
            throw ValidationErrors.isInValid
        }
        return username
    }
}

enum ValidationErrors: LocalizedError{
    case isInValid
    
    var errorDescription: String?{
        switch self{
        case .isInValid:
            return "The vale is invalid"
        }
    }
}
