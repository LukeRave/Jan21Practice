//
//  StateManager.swift
//  tabBarStates
//
//  Created by Luat on 1/28/22.
//

import Foundation

protocol StateManager {
    func setState(state: AppData)
}
protocol UserInfoManager {
    func setState(state: UserInfo)
}
protocol QuantityInfoManager {
    func setState(state: QuantityInfo)
}

protocol UserInfo {
    var name: String { get set }
    var email: String { get set }
}

protocol QuantityInfo {
    var totalTime: Double { get set }
    var dosage: Double { get set }
    var email: String { get set }
}

/// Breaking dependency on Singleton: using dependency injection
/// Can be passed as a single object to all VC that needs it
/// OR can be passed via protocol to limit access to what is being used
class AppData: QuantityInfo, UserInfo {
    var totalTime: Double = 0
    var dosage: Double = 0
    var email: String = "No email"
    var name: String = "No name"
}
