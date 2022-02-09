//
//  ShowViewController+DataSource.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import Foundation
import UIKit

extension ShopViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = viewModel.recommendeds?.count{
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.productCellID.rawValue) as? ProductCell{
            cell.viewModel.model = viewModel.recommendeds?[indexPath.row]
            cell.configureView()
            cell.addToFavorites = {
                self.addToFavorites(index: indexPath.row)
            }
            cell.addToCart = {
                self.addToCart(index: indexPath.row)
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
        vc.isFromHome = false
        vc.viewModel = ProductsViewModel()
        vc.viewModel?.setFavorites()
        self.present(vc, animated: true, completion: nil)
    }
    
    func addToCart(index: Int){
        self.viewModel.addToCart(atIndex: index)
        let alert = UIAlertController(for: StringConstants.cart.rawValue, confirmAction: {
            self.presentCart()
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentCart(){
        let storyBoard = UIStoryboard(name: StringConstants.cart.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier:StringConstants.cart.rawValue) as! CartViewController
        self.present(vc, animated: true, completion: nil)
    }
}
