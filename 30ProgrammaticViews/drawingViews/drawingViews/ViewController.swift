//
//  ViewController.swift
//  drawingViews
//
//  Created by Luat on 1/20/21.
//

import UIKit

class ViewController: UIViewController {

    let myCustomView: RamenView = {
        let view = RamenView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.9, green: 0.3, blue: 0.2, alpha: 1)
        view.addSubview(myCustomView)
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(handleTap(gestReg:)))
        myCustomView.addGestureRecognizer(tapGest)
        
    }

    @objc func handleTap(gestReg: UITapGestureRecognizer) {
        
        if let myCustomView = gestReg.view as? RamenView {
            myCustomView.drawMore = !myCustomView.drawMore
        }
    }

}

