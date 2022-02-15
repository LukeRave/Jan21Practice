//
//  ViewController.swift
//  temperature
//
//  Created by Luat on 2/8/21.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func pressed(_ sender: Any) {
        guard let detailsVC = storyboard?.instantiateViewController(identifier: "DetailsVC") as? DetailsVC else { return }
        detailsVC.viewModel = TempViewModel(temp: 98.6, scale: TempScale.farenheit)
        navigationController?.pushViewController(detailsVC, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

