//
//  ViewController.swift
//  ProtocolNetworking
//
//  Created by Luat on 2/7/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topAlbumLabel: UILabel!
    
    @IBOutlet weak var topAlbumArt: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTopAlbums()
        getImage()
    }
    
    func getTopAlbums() {
        let topAlbumRequest = TopAlbumRequest()
        topAlbumRequest.getAlbums { result in
            print("#", result)
            
            
        }
    }

    let imageURL = URL(string: "https://is5-ssl.mzstatic.com/image/thumb/Music126/v4/ea/ce/2b/eace2b23-3b2d-543c-9adf-23a2c97a03ca/886449863563.jpg/100x100bb.jpg")!
    
    func getImage() {
        let imageRequest = ImageRequest(url: imageURL)
        imageRequest.startRequest { result in

        }
    }

}

