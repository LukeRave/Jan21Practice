//
//  FeatureTwoVC.swift
//  ProtocolNetworking
//
//  Created by Isaac Farr on 2/8/22.
//
import UIKit

class FeatureTwoVC: UIViewController {

    @IBOutlet weak var alcyholImage: UIImageView!
    
    @IBOutlet weak var alycholLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAlcyhol()
    }
    
    func getAlcyhol(){
        
        let alcyhol = ThaAlcyholsRequest()
        alcyhol.getDranks { result in
            
        }
        alcyhol.getDranks(completion: { result in
            guard let drinks = try? result.get() else { return }
            let imageURLString = drinks[0].strDrinkThumb
            self.imageURL = URL(string: imageURLString)!
            self.getImage()
            
            DispatchQueue.main.async {
                
                self.alycholLabel.text = drinks[0].strDrink
            }
            
        })
    }
    
    // replace after finishing rest of assignment
    var imageURL: URL?
    
    func getImage(){
        let imageRequest = ImageRequest(url: imageURL!)
        imageRequest.startRequest { result in
            DispatchQueue.main.async {
                
                self.alcyholImage.image = result
            }
        }
    }
    
}
