//
//  AccessCodeViewModel.swift
//  timerUpdate
//
//  Created by Luat on 2/2/22.
//

import Foundation
import UIKit

class AccessCodeViewModel {
    
    private var accessCodeModel: AccessCodeModel?  {
        didSet {
            DispatchQueue.main.async {
                self.updateCode(self.accessCodeModel)
            }
        }
    }
    private var accessCodeNetwork = NetworkManager()

    var updateCode: (AccessCodeModel?) -> Void = { _ in }
    
    func updateData() {
        accessCodeNetwork.cycleCodeOnRepeat { model in
            self.accessCodeModel = model
        }
    }
}

