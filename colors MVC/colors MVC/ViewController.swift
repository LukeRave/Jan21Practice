//
//  ViewController.swift
//  colors MVC
//
//  Created by Rave Bizz on 2/1/22.
//

import UIKit

class ViewController: UIViewController, GetHexDataProtocol {
    @IBOutlet weak var colorNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    let hexViewModel = HexViewModel()
    
    func getData(for hexString: String){
        hexViewModel.getData(for: hexString, completion:{
            [weak self] in
            guard let welf = self else {
                return
            }
            welf.setBackground(with: welf.hexViewModel.getColor())
            welf.setColorName(with: welf.hexViewModel.getName())
        })
    }
    
    func setBackground(with hex: String){
        view.backgroundColor = UIColor(hex: hex)
    }
    
    func setColorName(with name: String){
        colorNameLabel.text = name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? selectionViewController else {
            print("failed to find destination")
            return
        }
        dest.delegate = self
    }
}

protocol GetHexDataProtocol {
    func getData(for hexString: String)
}
