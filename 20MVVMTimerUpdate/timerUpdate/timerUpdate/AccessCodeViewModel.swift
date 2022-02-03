//
//  AccessCodeViewModel.swift
//  timerUpdate
//
//  Created by Luat on 2/2/22.
//

import Foundation
import UIKit

class AccessCodeViewModel {
    
    private var accessCodeModel: AccessCodeModel?{
        didSet{
            DispatchQueue.main.async{
                self.updateUI(self.accessCodeModel)
            }
        }
    }
    private var accessCodeNetwork = NetworkManager()
    
    var updateUI: (AccessCodeModel?) -> Void = { _ in }
    
    func updateData(){
        accessCodeNetwork.cycleCodeOnRepeat(completion: { model in
            self.accessCodeModel = model
        })
    }
}
