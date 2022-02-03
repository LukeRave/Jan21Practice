//
//  HexViewModel.swift
//  colors MVC
//
//  Created by Rave Bizz on 2/1/22.
//

import Foundation
import UIKit

final class HexViewModel{
    static var shared = HexViewModel()
    private init(){}
    private var model: HexResponse?
    private var rgb: [CGFloat] = [0, 0, 0] {
        didSet {
            self.updateMainView(self.rgb)
        }
    }
    func getData(completion: @escaping () -> Void) {
        APIManager.shared.getData(for: self.rgb, completion: {model in
            self.model = model
            DispatchQueue.main.async { completion() }
        })
    }
    func getColor() -> String? { model?.hex?.value }
    func getName() -> String? { model?.name?.value }
    func getIsexactMatch() -> String? {
        if let boolVal = model?.name?.isExactMatch, boolVal == true {
            return "Exact Match"
        }
        return "Not Exact Match"
    }
    func setRGB(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.rgb[0] = r
        self.rgb[1] = g
        self.rgb[2] = b
        print(self.rgb)
    }
    var updateMainView: ([CGFloat]) -> Void = { _ in }
}
