//
//  SecondViewController.swift
//  ColorPicker
//
//  Created by ravebizz on 1/31/22.
//

import UIKit

class SecondViewController: UIViewController {

    var delegate: ChangeBackgroundColorProtocol?
    
    @IBAction func BlueClicked(_ sender: Any) {
        delegate?.ChangeBackgroundColor(color: .blue)
    }
    
    @IBAction func RedClicked(_ sender: Any) {
        delegate?.ChangeBackgroundColor(color: .red)
    }
    
    @IBAction func GreenClicked(_ sender: Any) {
        delegate?.ChangeBackgroundColor(color: .green)
    }
    
    @IBAction func YellowClicked(_ sender: Any) {
        delegate?.ChangeBackgroundColor(color: .yellow)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
