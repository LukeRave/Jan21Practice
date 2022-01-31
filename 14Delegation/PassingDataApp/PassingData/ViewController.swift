//
//  ViewController.swift
//  PassingData
//
//  Created by Luat on 1/28/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        
    }

}
/*
 Passing Data Forward: grab reference to the new VC
 1) Via Segue.destination in prepare(for segue)
 2) Via Programmatic navigation and instantiating newVC with identifier
 
 Passing Data Backwards:
 1) IBAction func unwind() .source.data
 2) Delegation
 3) Closures
 
 Using shared App State (Model Controller)
 1) Via SceneDelegate window.rootViewController (usually for tabBar)
 - pass reference to VC that needs the data
 
 Helpful Code:
 1) Extending segue to type cast destination VC
 - segue.forward(contact, to: segue.destination)
 
 Bad Practices:
 1) Holding reference to previous VC: breaks when navigation flow changes
 2) Singleton: Global access, adds a dependency, coupled, hard to test, hard to reuse
 3) UserDefaults: for simple data types
 4) NotificationCenter: no control over which object will receive and in which order
 
 */

extension UIStoryboardSegue {
    func forward(_ contact: Contact?, to destination: UIViewController) {
        if let navigationController = destination as? UINavigationController {
            let root = navigationController.viewControllers[0]
            forward(contact, to: root)
        }
        if let detailViewController = destination as? DetailViewController {
            detailViewController.contact = contact
        }
        if let editContactViewController = destination as? EditContactViewController {
            editContactViewController.contact = contact
        }
    }
}

struct Contact {
    
}

class DetailViewController: UIViewController {
    var contact: Contact?
}

class EditContactViewController: UIViewController {
    var contact: Contact?
}
