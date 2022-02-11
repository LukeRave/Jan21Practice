//
//  ProductCell.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    let viewModel = ProductCellViewModel()
    var addToCart: (() -> Void)?
    var addToFavorites: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
        configureButtons()
    }
    
    
    func configureButtons(){
        heartButton.addTarget(self, action: #selector(handleHeartAction), for: .touchUpInside)
        addToCartButton.addTarget(self, action: #selector(handleCartAction), for: .touchUpInside)
    }
    
    func configureView(){
        if let name = viewModel.getName(){
            nameLabel.text = name
        }
        if let brand = viewModel.getBrand(){
            brandLabel.text = brand
        }
        if let price = viewModel.getPrice(){
            priceLabel.text = price
        }
        if let rating = viewModel.getRating(){
            ratingLabel.text = rating
        }
        if let url = viewModel.getPhoto(){
            productImage.getImage(for: url)
        }
    }
    
    @objc func handleHeartAction(){
        addToFavorites?()
    }
    
    @objc func handleCartAction(){
        addToCart?()
    }
    
}
