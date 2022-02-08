//
//  DrinkViewController.swift
//  ProtocolNetworking
//
//  Created by Rave Bizz on 2/8/22.
//

import UIKit

class DrinkViewController: UIViewController {

    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    var drinks: [Drink]?
    override func viewDidLoad() {
        super.viewDidLoad()
        getTopDrinks()
        // Do any additional setup after loading the view.
    }
    
    func getTopDrinks(){
        let topDrinkRequest = TopDrinkRequest()
        topDrinkRequest.getDrinks { result in
            switch result{
            case .success(let drink):
                self.drinks = drink
                let firstDrink = self.drinks?.first
                DispatchQueue.main.async{
                    self.drinkName.text = firstDrink?.name
                }
                if let imgUrl = firstDrink?.imgUrl, let url = URL(string: imgUrl){
                    self.getImage(url: url)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    func getImage(url: URL) {
            let imageRequest = ImageRequest(url: url)
            imageRequest.startRequest { result in
                DispatchQueue.main.async {
                    self.img.image = result
                }
            }
        }
}
