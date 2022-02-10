//
//  FilterVC+DataSource .swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import Foundation
import UIKit


extension FilterViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag{
        case 0:
            return Contstants.shared.tags.count
        case 1:
            return Contstants.shared.productTypes.count
        case 2:
            return Contstants.shared.brands.count
        default:
           return 10
        }
    }
    
    
}
