//
//  ViewController.swift
//  multiScreens
//
//  Created by Luat on 1/25/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home Page"
    
        self.navigationController
        let vcs = self.tabBarController?.viewControllers
        
        if let secondVc = vcs?[1] as? SecondViewController {
            secondVc.myTitle = "New title From FirstVC"
        }
        
    }
    
    /// Passing Data with segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue")
        let secondVC = segue.destination as? SecondViewController
        secondVC?.myTitle = "Second Page"
    }

}

