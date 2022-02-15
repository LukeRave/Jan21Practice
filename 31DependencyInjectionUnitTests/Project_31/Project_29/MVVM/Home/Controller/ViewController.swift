//
//  ViewController.swift
//  Project_29
//
//  Created by Rave Bizz on 2/11/22.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ViewModal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.getList()
        configureTable()
        self.tableView.reloadData()
        
    }
        
    func configureTable(){
        let nib = UINib(nibName: MusicCell.identifier, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: MusicCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }

}

