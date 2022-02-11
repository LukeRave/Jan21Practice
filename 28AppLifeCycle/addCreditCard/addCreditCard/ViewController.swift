//
//  ViewController.swift
//  addCreditCard
//
//  Created by Luat on 2/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    var state: Int = 0 {
        didSet {
            detectChange()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.state = UIApplication.shared.applicationState.rawValue
        
    }


}

func detectChange() {
    let state = UIApplication.shared.applicationState
    var count = 0
    switch state {
    case .active:
        
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {timer in
                print("App is in foreground and active \(count)")
                count += 1
            }
        
    case .background:
        
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {timer in
                print("App is in background \(count)")
                count += 1
            }
        
    case .inactive:
        //self.count = 0
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {timer in
                    print("App is in foreground and active \(count)")
                    count += 1
                }
        
    }
}
