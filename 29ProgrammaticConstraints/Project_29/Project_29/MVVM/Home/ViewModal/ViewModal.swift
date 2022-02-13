//
//  ViewModal.swift
//  Project_29
//
//  Created by Rave Bizz on 2/11/22.
//

import Foundation

class ViewModal {
    var list: [Album]?
    
    func getList(){
        list = DataManager.shared.getData()
    }
}
