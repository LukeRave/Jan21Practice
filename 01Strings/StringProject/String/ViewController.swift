//
//  ViewController.swift
//  String
//
//  Created by Luat on 8/2/21.
//

import UIKit

class ViewController: UIViewController {

    let tester = Tester.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sample = tester.isPalindrome(word: "tacocat")
        print(sample)
        
    }


}

