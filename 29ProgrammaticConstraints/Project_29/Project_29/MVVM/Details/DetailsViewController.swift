//
//  DetailsViewController.swift
//  Project_29
//
//  Created by Rave Bizz on 2/13/22.
//

import UIKit

class DetailsViewController: UIViewController {

    static let identifier = String(describing: DetailsViewController.self)
    
    lazy var albumView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.frame = CGRect(x: 80, y: 170, width: 250, height: 250)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(albumView)
        // Do any additional setup after loading the view.
    }

}
