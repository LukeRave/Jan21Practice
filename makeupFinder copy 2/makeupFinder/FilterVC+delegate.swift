//
//  FilterVC+delegate.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import Foundation
import UIKit

extension FilterViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag{
        case 0:
            return Contstants.shared.tags[row]
        case 1:
           return Contstants.shared.productTypes[row]
        case 2:
            return Contstants.shared.brands[row]
        default:
            return "title"
        }
    }
   func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag{
        case 0:
            let selectedText = Contstants.shared.tags[row]
            if selectedText != StringConstants.none.rawValue {
                tagLabel.text = selectedText
                tagLabel.isHidden = false
                tagButton.isHidden = false
                queryParams.append(selectedText)
            }
        case 1:
            let selectedText = Contstants.shared.productTypes[row]
            if selectedText != StringConstants.none.rawValue {
                typeLabel.text = selectedText
                typeLabel.isHidden = false
                typeButton.isHidden = false
                queryParams.append(selectedText)
            }
        case 2:
            let selectedText = Contstants.shared.brands[row]
            if selectedText != StringConstants.none.rawValue {
                brandLabel.text = selectedText
                brandLabel.isHidden = false
                brandButton.isHidden = false
                queryParams.append(selectedText)
            }
        default:
            break
        }
    }
}
