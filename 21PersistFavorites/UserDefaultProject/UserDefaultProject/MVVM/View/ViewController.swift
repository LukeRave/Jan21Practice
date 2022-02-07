//
//  ViewController.swift
//  UserDefaultProject
//
//  Created by Rave Bizz on 2/6/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

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
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = NasaPhotosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.updateData()
        viewModel.updateUI = { model in
            self.feed = model
        }
        
        tableView.dataSource = self
        let nib = UINib(nibName: DataViewCell.identifier, bundle: nil)
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
