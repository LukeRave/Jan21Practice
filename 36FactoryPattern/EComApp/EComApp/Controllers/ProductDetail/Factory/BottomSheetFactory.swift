//
//  BottomSheetFactory.swift
//  EComApp
//
//  Created by Luat on 2/21/22.
//

import Foundation
import UIKit

struct BottomSheetFactory {

    private static let factoryType: FactoryType = {
        if #available(iOS 15, *) {
            return AppleSheetFactory()
        } else {
            return CustomSheetFactory()
        }
    }()
    
    static func createBottomSheetController() -> SheetControllerProtocol {
        return factoryType.createSheetViewController()
    }
    
}
protocol SheetControllerProtocol: UIViewController {
    var shouldAnimate: Bool { get }
}

extension SheetControllerProtocol {
    var shouldAnimate: Bool {
        if #available(iOS 15, *) {
            return true
        } else {
            return false
        }
    }
}

protocol FactoryType {
    func createSheetViewController() -> SheetControllerProtocol
}

struct AppleSheetFactory: FactoryType {
    func createSheetViewController() -> SheetControllerProtocol {
        
        guard #available(iOS 15, *) else {
            fatalError("Sheet Presentation controller is not supported on this platform")
        }
        
        let vc = AppleSheetViewController()
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        return vc
    }
}

struct CustomSheetFactory: FactoryType {
    func createSheetViewController() -> SheetControllerProtocol {
        let vc = ProductDetailViewController()
        vc.modalPresentationStyle = .overCurrentContext
        return vc
    }
}
