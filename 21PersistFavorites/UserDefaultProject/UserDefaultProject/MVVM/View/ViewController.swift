//
//  ViewController.swift
//  UserDefaultProject
//
//  Created by Rave Bizz on 2/6/22.
//

import UIKit
protocol PassData {
    func fetchData()
}

class ViewController: UIViewController, PassData {

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
        
        tableView.dataSource = self
        let nib = UINib(nibName: DataViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DataViewCell.identifier)
        
    }
    
    func fetchData(){
        viewModel.getData(completion: { [weak self] in
            guard let welf = self else {
                return
            }
            
        })
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DataViewCell.identifier) as? DataViewCell else {
            return UITableViewCell()
        }

        return cell
    }


}
