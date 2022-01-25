//
//  SecondViewController.swift
//  multiScreens
//
//  Created by Luat on 1/25/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    var myTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        title = "\(myTitle ?? "No title")"
        presentThirdVC()
        
    }
    
    func presentThirdVC() {
        if let thirdVC = storyboard?.instantiateViewController(withIdentifier: "ThirdVCID") as? ThirdViewController {
            thirdVC.productName = "iPHone"
            navigationController?.pushViewController(thirdVC, animated: true)
        }
        
        
    }


}
