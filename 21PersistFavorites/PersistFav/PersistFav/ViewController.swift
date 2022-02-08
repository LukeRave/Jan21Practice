//
//  ViewController.swift
//  PersistFav
//
//  Created by Matthew Flores on 2/7/22.
//

import UIKit

class ViewController: UIViewController {
    let API = APIManager()
    var photolist = Const.list {
        didSet {
            DispatchQueue.main.async {
                self.Table.reloadData()
            }
        }
    }
    @IBOutlet weak var Table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        API.fetchNasaData(){ parsedData in
            DispatchQueue.main.async {
                PhotoList.createList(parsedData: parsedData)
                self.photolist = Const.list
            }
        }
        Table.dataSource = self
        Table.register(UITableViewCell.self, forCellReuseIdentifier: Const.cellID)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Const.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Const.cellID, for: indexPath)
        cell.textLabel?.text = Const.list[indexPath.row].rover?.name
        return cell
    }
    
    
}
