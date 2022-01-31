//
//  SecondVC.swift
//  IsaacsDelegatePattern
//
//  Created by Isaac Farr on 1/31/22.
//

import UIKit

class SecondVC: UIViewController {
    
    var delegate: ColorChangeDelegate?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    var currentColor: UIColor?;
    @IBAction func redButton(_ sender: UIButton) {
        setColor(buttonColor: #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1))
    }
    @IBAction func greenButton(_ sender: UIButton) {
        setColor(buttonColor: #colorLiteral(red: 0.2066814005, green: 0.7795598507, blue: 0.349144876, alpha: 1))
    }
    @IBAction func blueButton(_ sender: UIButton) {
        setColor(buttonColor: #colorLiteral(red: 0.02625587583, green: 0.3824955523, blue: 0.7998301387, alpha: 1))
    }
    @IBAction func yellowButton(_ sender: UIButton) {
        setColor(buttonColor: #colorLiteral(red: 0.8019409776, green: 0.6408478618, blue: 0.03579719737, alpha: 1))
    }
    
    func setColor(buttonColor: UIColor){
        currentColor = buttonColor;
        delegate?.setColor(color: currentColor!)
        dismiss(animated: true)
    }
}


