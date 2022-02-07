//
//  ViewController.swift
//  NASAStalker
//
//  Created by Rave Training on 2/4/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        MainViewModel.shared.retreiveFeedData {
            <#code#>
        }
//        NetworkManager.shared.makeRequest(completion: {data in
//            data.photos?.forEach { NetworkManager.shared.makeIMGRequest(strURL: $0.img_src, completion: { img in
//                DispatchQueue.main.async {
//                    let myimage = UIImageView(image: UIImage(data: img))
//                    self.view.addSubview(myimage)
//                }
//            } ) }
//        })
        MainViewModel.shared.retreiveFeedData(completion: {})
    }
}
