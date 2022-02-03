//
//  NetworkManager.swift
//  timerUpdate
//
//  Created by Luat on 2/2/22.
//

import Foundation
/*
 Data Flow:
 Sever -> NetworkManager -> ViewModel -> Model
 Model -> ViewModel -> View updates
 Controller should not see the model
 
 */

struct NetworkManager {
    func cycleCodeOnRepeat(completion: @escaping (AccessCodeModel) -> Void) {
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { _ in
            let accessCodeModel = Server.generateAccessCodeModel()
            completion(accessCodeModel)
        }
    }
}

/// Some server function
private class Server {
    static func generateAccessCodeModel() -> AccessCodeModel {
        let alpha = "abcdefghijklmnopqrstuvwxyz"
        var code = ""
        for _ in 0...5 {
            let random = Int.random(in: 0...25)
            let index = alpha.index(alpha.startIndex, offsetBy: random)
            code.append(alpha[index])
        }
        return AccessCodeModel(accessCode: code)
    }
}
