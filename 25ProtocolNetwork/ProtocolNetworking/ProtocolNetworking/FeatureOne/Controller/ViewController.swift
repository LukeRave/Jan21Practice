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
    }
    
    func getTopAlbums() {
        let topAlbumRequest = TopAlbumRequest()
        topAlbumRequest.getAlbums { result in
            switch(result) {
            case(.success(let musicItem)):
                let item = musicItem.first
                DispatchQueue.main.async {
                    self.topAlbumLabel.text = item?.name
                }
                if let urlStr = item?.artworkUrl100, let url = URL(string: urlStr) {
                    self.getImage(url: url)
                }
            case(.failure(let error)):
                print(error)
            }
        }
    }
    
    func getImage(url: URL) {
        let imageRequest = ImageRequest(url: url)
        imageRequest.startRequest { result in
            DispatchQueue.main.async {
                self.topAlbumArt.image = result
            }
        }
    }

}

