//
//  Coordinator.swift
//  coordinator
//
//  Created by Luat on 2/9/21.
//

import UIKit


class Coordinator {
    var navCon: UINavigationController
    
    init(navCon: UINavigationController) {
        self.navCon = navCon
    }
    
    func pushStartingVC() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(identifier: "ViewController") as? ViewController else {
            return
        }
        vc.coordinator = self
        navCon.pushViewController(vc, animated: true)
    }
    
    func pushProductVC() {
        let vc = ProductViewController.createSelf(sb: "Main")
        navCon.pushViewController(vc, animated: true)
    }
    
    func pushAccountVC() {
        let vc = AccountViewController.createSelf(sb: "Main")
        navCon.pushViewController(vc, animated: true)
    }
    
}

protocol Storyboarding {
    static func createSelf(sb: String) -> Self
}

extension Storyboarding where Self: UIViewController {
    static func createSelf(sb: String) -> Self {
        let sb = UIStoryboard(name: sb, bundle: nil)
        let id = String(describing: self)
        let vc = sb.instantiateViewController(identifier: id) as! Self
        return vc
    }
}
