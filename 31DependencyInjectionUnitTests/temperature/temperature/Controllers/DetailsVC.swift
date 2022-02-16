//
//  DetailsVC.swift
//  temperature
//
//  Created by Luat on 2/8/21.
//

import UIKit

class DetailsVC: UIViewController {
    
    var viewModel: TempViewModel?
    
    @IBOutlet weak var temp: UILabel!
    @IBAction func leftButton(_ sender: UIButton) {
        viewModel?.convertToCelcius()
    }
    @IBAction func rightButton(_ sender: Any) {
        viewModel?.convertToFarenheit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVM()
        temp.text = viewModel?.formatText
    }
    
    func setupVM() {
        viewModel?.updateLabel = { newStr in
            self.temp.text = newStr
        }
    }
    
}

enum TempScale: String {
    case celcius = "C"
    case farenheit = "F"
    case kelvin = "K"
}
