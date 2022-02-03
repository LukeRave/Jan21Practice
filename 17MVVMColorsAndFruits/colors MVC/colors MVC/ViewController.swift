//
//  ViewController.swift
//  colors MVC
//
//  Created by Rave Bizz on 2/1/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var hexColorName: UILabel!
    @IBOutlet weak var hexIsExactMatch: UILabel!
    @IBOutlet weak var hexColorCode: UILabel!
    
    
    @IBAction func newColorSelection(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToSelection", sender: self)
    }
    func setHexColorName(text: String) { self.hexColorName.text = text }
    func setExactMath(text: String) { self.hexIsExactMatch.text = text }
    func setHexColorCode(text: String) { self.hexColorCode.text = text }
    func setViewBackground(color: UIColor) {self.view.backgroundColor = color }
    override func viewDidLoad() {
        super.viewDidLoad()
        HexViewModel.shared.updateMainView = { rgb in
            HexViewModel.shared.getData(completion: {
                self.setHexColorName(text: HexViewModel.shared.getName() ?? "")
                self.setHexColorCode(text: HexViewModel.shared.getColor() ?? "")
                self.setExactMath(text: HexViewModel.shared.getIsexactMatch() ?? "")
                self.setViewBackground(color: UIColor.init(red: rgb[0], green: rgb[1], blue: rgb[2], alpha: 1))
            })
        }
    }
}
