//
//  AccessCodeModel.swift
//  timerUpdate
//
//  Created by Luat on 2/2/22.
//

import Foundation

struct AccessCodeModel {
    private var accessCode: String?
    
    init(accessCode: String) {
        self.accessCode = accessCode
    }
    
    private func generateUserPin() -> String {
        let alpha = "0123456789"
        var pin = ""
        for _ in 0...2 {
            let random = Int.random(in: 0...9)
            let index = alpha.index(alpha.startIndex, offsetBy: random)
            pin.append(alpha[index])
        }
        return pin
    }
    
}

