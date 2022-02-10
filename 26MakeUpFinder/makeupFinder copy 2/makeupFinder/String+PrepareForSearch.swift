//
//  String+PrepareForSearch.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/7/22.
//

import Foundation

extension String{
    func prepareForSearch() -> [String]{
        var textArray:[String] = []
        self.split(separator: " ").forEach({
            subString in
            textArray.append(String(subString))
        })
        return textArray
    }
}
