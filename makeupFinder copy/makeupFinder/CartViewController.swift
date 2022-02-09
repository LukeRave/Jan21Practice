//
//  CartViewController.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var viewModel = CartViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCart()
        priceLabel.text = viewModel.getTotal()
        configureTable()
        // Do any additional setup after loading the view.
    }
    
    func configureTable(){
        tableView.register(UINib(nibName: StringConstants.productCellName.rawValue, bundle: nil), forCellReuseIdentifier: StringConstants.productCellID.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
    }

}
