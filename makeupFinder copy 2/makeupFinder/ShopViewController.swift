//
//  ShopViewController.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import Foundation
import UIKit

class ShopViewController: UIViewController {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    let viewModel = ShopViewModel()
    let homeView = HomeViewModel()
    let home = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
    }
    
    func configureTable(){
        tableView.register(UINib(nibName: StringConstants.productCellName.rawValue, bundle: nil), forCellReuseIdentifier: StringConstants.productCellID.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func configureButtons(){
        searchButton.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
    }
    
    @objc func handleSearch(){
        if let text = searchField.text{
            viewModel.handleSearch(for: text, handleError: {
                self.handleError()
            }, completion: {
                if text.lowercased() == "clear" {
                    self.homeView.favorites = []
                    self.homeView.cart = []
                    DispatchQueue.main.async {
                        self.home.recentTableView.reloadData()
                        self.home.favoritesTableView.reloadData()
                        return
                    }
                }
                self.presentResults()
            })
        }
    }
    
    func handleError(){
        let alert = UIAlertController(title: "Alert", message: "No Matches", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentResults(){
        let storyBoard = UIStoryboard(name: StringConstants.recentSBName.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: StringConstants.recentSBID.rawValue) as! ProductsViewController
        vc.viewModel = ProductsViewModel()
        vc.viewModel?.makeupModel = self.viewModel.modelToSend
        vc.titleText = StringConstants.searchResults.rawValue
        self.present(vc, animated: true, completion: nil)
    }
}
