//
//  ThirdViewController.swift
//  multiScreens
//
//  Created by Luat on 1/25/22.
//

import UIKit

class ThirdViewController: UIViewController {
    var myTitle: String?
    var productName: String?
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(myTitle ?? "")"
        print("arriving to third VC with data: \(productName)")
    }
    
//    func presentFourthVC() {
//        if let fourthVC = storyboard?.instantiateViewController(withIdentifier: "FourthVCID") as? FourthViewController {
//            fourthVC.phone = self.productName
//            navigationController?.pushViewController(fourthVC, animated: true)
//        }
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue")
        let fourthVC = segue.destination as? FourthViewController
        fourthVC?.myTitle = "Fourth Page"
        fourthVC?.phone = self.productName
    }
}
