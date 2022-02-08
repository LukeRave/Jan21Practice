//
//  ViewController.swift
//  UserDefaultProject
//
//  Created by Rave Bizz on 2/6/22.
//

import UIKit

protocol Favor{
    func updateFavorite(row: Int)
}

class ViewController: UIViewController {
    
    // Create updateFavorite(row: Int)
    
    @IBOutlet weak var tableView: UITableView!
    
    var feed: PhotosResponse? {
        didSet{
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }
    
    var photos: [Photo] {
        get {
            feed?.photos ?? []
        }
    }
    
    let viewModel = NasaPhotosViewModel()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: DataViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DataViewCell.identifier)
        
        super.viewDidLoad()
        viewModel.updateData()
        viewModel.getData(completion: { [weak self] in
            guard let welf = self else{
                return
            }
            self?.feed = welf.viewModel.model
        })
    }
}
