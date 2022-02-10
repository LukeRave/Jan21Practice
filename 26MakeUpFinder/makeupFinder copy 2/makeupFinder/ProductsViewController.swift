//
//  ProductsViewController.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import UIKit

class ProductsViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ProductsViewModel?
    var titleText: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setTitle()
    }
    func setTitle(){
        if let title = titleText{
            titleLabel.text = title
        }
    }
    func configureTableView(){
        tableView.register(UINib(nibName: StringConstants.productCellName.rawValue, bundle: nil), forCellReuseIdentifier: StringConstants.productCellID.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
    }
    


}
