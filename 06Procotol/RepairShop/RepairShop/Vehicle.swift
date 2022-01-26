//
//  Vehicle.swift
//  RepairShop
//
//  Created by Rave Bizz on 1/26/22.
//

import Foundation

struct Vehicle: Equatable {
    var wheels: Int
    var acceleration: Int
    var braking: Int
    var id: Int
    var make: String
    var model: String
    
    mutating func newId(){
        id = Int.random(in: 1..<100)
    }
}
