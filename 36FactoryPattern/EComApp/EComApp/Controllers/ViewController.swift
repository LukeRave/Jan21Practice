//
//  ViewController.swift
//  EComApp
//
//  Created by Luat on 1/26/22.
//

import UIKit

class ViewController: UIViewController {

    var inventory = Inventory.createInventory()
    override func viewDidLoad() {
        super.viewDidLoad()
        inventory.fillCount()
        print(inventory)
    }
    
    
}

