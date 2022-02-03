//
//  FourthViewController.swift
//  multiScreens
//
//  Created by Luat on 1/25/22.
//

import UIKit

class FourthViewController: UIViewController {
    var myTitle : String?
    var phone : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(myTitle ?? "No Title")"
        print("arriving to fourth VC with data: \(phone ?? "")")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
