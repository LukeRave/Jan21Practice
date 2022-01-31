//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        func updateTimeToAnimate( time: inout Double){
            time = time + 3.0 + (Double(titleLabel.text.count) * titleLabel.charInterval)
        }
        
        titleLabel.charInterval = 0.15
        
        var timeToAnimate = 0.0;
        updateTimeToAnimate(time: &timeToAnimate)
        Timer.scheduledTimer(withTimeInterval: timeToAnimate, repeats: false) { _ in
            self.titleLabel.charInterval = 0.085
            self.titleLabel.text = "The chat app NOBODY needs.🥲"
        }
        titleLabel.text = K.appName    }
    
}
