//
//  selectionViewController.swift
//  colors MVC
//
//  Created by Rave Bizz on 2/1/22.
//

import UIKit

class selectionViewController: UIViewController {
    
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    
    var delegate: PassData?
    
    
    @IBAction func redSlider(_ sender: UISlider) {
        redValue.text = String(Int(sender.value))
    }
    
    @IBAction func blueSlider(_ sender: UISlider) {
        blueValue.text = String(Int(sender.value))
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        greenValue.text = String(Int(sender.value))
    }
    
    @IBAction func updatePressed(_ sender: Any) {
        let str = "\(redValue.text ?? "0"),\(blueValue.text ?? "0"),\(greenValue.text ?? "0")"
        delegate?.fetchData(for: str)
        dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
