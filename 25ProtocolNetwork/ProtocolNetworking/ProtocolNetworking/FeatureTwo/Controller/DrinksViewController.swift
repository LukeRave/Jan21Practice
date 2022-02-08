//
//  DrinksViewController.swift
//  ProtocolNetworking
//
//  Created by ravebizz on 2/8/22.
//

import UIKit

class DrinksViewController: UIViewController {

    @IBOutlet weak var drinkTitle: UILabel!
    @IBOutlet weak var drinkImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getDrinks()
    }

    func getDrinks() {
        let drinkRequest = DrinkRequest()
        drinkRequest.getDrinks { result in
            switch(result) {
            case(.success(let drinkItem)):
                let item = drinkItem.first
                DispatchQueue.main.async {
                    self.drinkTitle.text = item?.strDrink
                }
                if let urlStr = item?.strDrinkThumb, let url = URL(string: urlStr) {
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
                self.drinkImage.image = result
            }
        }
    }
}
