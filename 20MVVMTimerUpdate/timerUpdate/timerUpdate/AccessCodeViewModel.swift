//
//  AccessCodeViewModel.swift
//  timerUpdate
//
//  Created by Luat on 2/2/22.
//

import Foundation
import UIKit

class AccessCodeViewModel {
    private var accessCodeNetwork = NetworkManager()
    private var accessCodeModel: AccessCodeModel?
    func startGeneratingCodes() -> Void {
        self.accessCodeNetwork.cycleCodeOnRepeat(completion: {model in
            self.updateView(model)
        })
    }
    var updateView: (AccessCodeModel) -> Void = { _ in }
}
