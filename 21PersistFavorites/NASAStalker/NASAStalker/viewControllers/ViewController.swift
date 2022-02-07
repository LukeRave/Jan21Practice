//
//  ViewController.swift
//  NASAStalker
//
//  Created by Rave Training on 2/4/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.makeRequest(completion: {model in
            print(model.photos?[0])
        })
    }


}

