//
//  CartVC+DataSource.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import Foundation
import UIKit

extension CartViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = viewModel.cart?.count{
            return count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.productCellID.rawValue) as? ProductCell{
            if let model = viewModel.cart?[indexPath.row]{
                cell.viewModel.model = model
            }
            cell.configureView()
            cell.addToCartButton.isHidden = true
            cell.addToFavorites = {
                self.addToFavorites(index: indexPath.row)
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    func addToFavorites(index: Int){
        self.viewModel.addToFavorites(atIndex: index)
        let alert = UIAlertController(for: StringConstants.favorites.rawValue, confirmAction: {
            self.presentFavorites()
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentFavorites(){
        let storyBoard = UIStoryboard(name: StringConstants.recentSBName.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier:StringConstants.recentSBID.rawValue) as! ProductsViewController
        vc.titleText = StringConstants.favorites.rawValue
        vc.viewModel = ProductsViewModel()
        vc.viewModel?.setFavorites()
        self.present(vc, animated: true, completion: nil)
    }
}
