//
//  Task.swift
//  ClassAndStruct
//
//  Created by Luat on 5/24/21.
//

import Foundation

/**
 1) Task (struct)
     • Properties:
     - timeReq: Int
     - roleReq: Role
     - isValid: Bool  (set default to be false)
     - isCompleted: Bool (set default to be false)
     •  Functions
     -  setIsValid(status:)
         • change isValid to status
     -  setIsComplete(status:Bool)
         • change isComplete to status
     -  setTimeReq(timeLeft:)
         • Reduce the timeReq property to timeLeft
 */

struct Task {

    var timeReq: Int
    let roleReq: Role
    var isValid: Bool = false
    var isComplete: Bool = false
    
    mutating func setIsComplete(status: Bool) {
        isComplete = status
    }
    
    mutating func setIsValid(status: Bool) {
        isValid = status
    }
    
    mutating func setTimeReq(timeLeft: Int) {
        timeReq = timeLeft
    }
}
