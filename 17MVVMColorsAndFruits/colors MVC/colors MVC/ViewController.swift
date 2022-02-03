//
//  ViewController.swift
//  colors MVC
//
//  Created by Rave Bizz on 2/1/22.
//

import UIKit

protocol PassData {
    func fetchData(for color:String)
}

class ViewController: UIViewController, PassData {
    
    @IBOutlet weak var colorName: UILabel!
    
    let viewModel = HexViewModel()
//    let col
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fetchData(for color:String){
        viewModel.getData(for: color, completion:{ [weak self] in
            guard let welf = self else {
                return
            }
            
            welf.update(text: welf.viewModel.getColor() ?? "")
            welf.setName(with: welf.viewModel.getName() ?? "")
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? selectionViewController {
            vc.delegate = self
        }
    }
    
    func update(text: String) {
        let color = UIColor(hex: text)
        self.view.backgroundColor = color
    }

    func setName(with name: String){
        colorName.text = name
    }
}

