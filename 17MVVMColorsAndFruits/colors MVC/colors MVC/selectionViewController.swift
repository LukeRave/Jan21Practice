//
//  selectionViewController.swift
//  colors MVC
//
//  Created by Rave Bizz on 2/1/22.
//

import UIKit

class selectionViewController: UIViewController {

    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var bSlider: UISlider!
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var gLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBAction func sliderRed(_ sender: Any) {
        self.rLabel.text = String(Int(rSlider.value*255))
    }
    @IBAction func sliderGreen(_ sender: Any) {
        self.gLabel.text = String(Int(gSlider.value*255))
    }
    @IBAction func sliderBlue(_ sender: Any) {
        self.bLabel.text = String(Int(bSlider.value*255))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func returnSetRGB(_ sender: Any) {
        self.setRGBData()
        self.dismiss(animated: true, completion: {})
    }
    
    func setRGBData() {
        HexViewModel.shared.setRGB(r: CGFloat(rSlider.value), g: CGFloat(gSlider.value), b: CGFloat(bSlider.value))
    }
}
