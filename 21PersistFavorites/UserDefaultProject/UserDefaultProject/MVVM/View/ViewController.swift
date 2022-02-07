//
//  ViewController.swift
//  UserDefaultProject
//
//  Created by Rave Bizz on 2/6/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
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
        super.viewDidLoad()
        viewModel.updateData()
        viewModel.getData(completion: { [weak self] in
            guard let welf = self else{
                return
            }
            self?.feed = welf.viewModel.model

        })
        
        tableView.dataSource = self
        let nib = UINib(nibName: "DataViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DataViewCell.identifier)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DataViewCell.identifier) as? DataViewCell else {
            return UITableViewCell()
        }
        let model = photos[indexPath.row]
        cell.idNumber.text = "\(model.id ?? 0)"
        cell.date.text = String(describing: model.date)
        
        return cell
    }
    
}
