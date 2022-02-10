//
//  ViewController.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/2/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var recentTableView: UITableView!
    
    @IBAction func searchButton(_ sender: Any) {
        
        if let searchText = searchField.text{
            viewModel.handleSearch(for: searchText, handleError: {
                self.handleError()
            }, completion: {
                self.presentResults()
            })
        }
        self.recentTableView.reloadData()
        self.favoritesTableView.reloadData()
    }
    
    let viewModel = HomeViewModel()
    @IBOutlet weak var favoritesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getFavorites()
        viewModel.getCart()
        configureTable()
        // Do any additional setup after loading the view
    }
    
    func configureTable(){
        favoritesTableView.register(UINib(nibName: StringConstants.productCellName.rawValue, bundle: nil), forCellReuseIdentifier: StringConstants.productCellID.rawValue)
        recentTableView.register(UINib(nibName: StringConstants.productCellName.rawValue, bundle: nil), forCellReuseIdentifier: StringConstants.productCellID.rawValue)
        favoritesTableView.dataSource = self
        recentTableView.dataSource = self
        favoritesTableView.delegate = self
        recentTableView.delegate = self
    }
    func handleError(){
        let alert = UIAlertController("")
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

