//
//  String+formatToPrice.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/7/22.
//

import Foundation
extension String{
    func formatToPrice() -> String{
        if self == StringConstants.defaultPrice.rawValue {
            return StringConstants.notAvailible.rawValue
        }
        let split = self.split(separator: ".")
        if split[1].count >= 2{
            return "$\(self)"
        }
        return "$\(self)0"
    }
}
