//
//  alertController+convienceInit.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/8/22.
//

import Foundation
import UIKit

extension UIAlertController {
    convenience init(for name: String,  confirmAction: @escaping () -> Void ){
        self.init(title: StringConstants.alertTitle.rawValue, message: StringConstants.alertMessage.rawValue + name, preferredStyle: .alert)
        let confirm = UIAlertAction(title: StringConstants.alertConfirm.rawValue + name, style: .default, handler: {_ in
            confirmAction()
        })
        let dismiss = UIAlertAction(title: StringConstants.alertDismiss.rawValue, style: .cancel, handler: {
            _ in
            self.dismiss(animated: true, completion: nil)
        })
        self.addAction(confirm)
        self.addAction(dismiss)
    }
    convenience init(_ for: String = ""){
        self.init(title: StringConstants.searchErrorTitle.rawValue, message: StringConstants.searchErrorMessage.rawValue, preferredStyle: .alert)
        
        self.addAction(UIAlertAction(title: "understod ^_^b", style: .cancel, handler: {_ in
            self.dismiss(animated: true, completion: nil)}))
    }
    convenience init(_ for: Int = 0) {
        self.init(title: StringConstants.invalidSearchTitle.rawValue, message: StringConstants.invalidSearch.rawValue, preferredStyle: .alert)
        self.addAction(UIAlertAction(title: "understod ^_^b", style: .cancel, handler: {_ in
            self.dismiss(animated: true, completion: nil)}))
    }
}

