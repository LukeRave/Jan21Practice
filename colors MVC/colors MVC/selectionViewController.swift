//
//  selectionViewController.swift
//  colors MVC
//
//  Created by Rave Bizz on 2/1/22.
//

import UIKit

class selectionViewController: UIViewController {

    var delegate: GetHexDataProtocol?
    
    
    @IBOutlet weak var rValueLabel: UILabel!
    @IBOutlet weak var gValueLabel: UILabel!
    @IBOutlet weak var bValueLabel: UILabel!
    @IBAction func rValueChanged(_ sender: UISlider) {
        rValueLabel.text = String(Int(sender.value*256))
    }
    @IBAction func gValueChanged(_ sender: UISlider) {
        
        gValueLabel.text = String(Int(sender.value*256))
    }
    @IBAction func bValueChanged(_ sender: UISlider) {
        bValueLabel.text = String(Int(sender.value*256))
    }
    @IBAction func changeColorClicked(_ sender: Any) {
        var n = Int(rValueLabel.text ?? "0")
//        var st1 = String(format:"%02X", n ?? 0)
        var st2 = String(n ?? 0)
        st2 += ","
        n = Int(gValueLabel.text ?? "0")
//        st1 += String(format:"%02X", n ?? 0)
        st2 += String(n ?? 0)
        st2 += ","
        n = Int(bValueLabel.text ?? "0")
//        st1 += String(format:"%02X", n ?? 0)
        st2 += String(n ?? 0)
        delegate?.getData(for: st2)
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
}
