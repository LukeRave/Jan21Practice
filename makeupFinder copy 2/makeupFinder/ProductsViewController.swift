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
    var isFromHome = false
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setTitle()
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "loadProducts"), object: nil)

    }
    @objc func loadList(notification: NSNotification){
        //load data here
        self.tableView.reloadData()
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
