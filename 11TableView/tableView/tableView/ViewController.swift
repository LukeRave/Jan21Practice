//
//  ViewController.swift
//  tableView
//
//  Created by Rave Bizz on 1/26/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var list: [ListItem] = ListManager.generateItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        let nib = UINib(nibName: cellTableViewCell.identifier, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: cellTableViewCell.identifier)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellTableViewCell.identifier) as? cellTableViewCell else{
            return UITableViewCell()
        }
        let listItem = list[indexPath.row]
        
        cell.cellTitle.text = listItem.title
        cell.cellDesc.text = listItem.description
        cell.cellStatus.text = listItem.status.rawValue
        cell.backgroundColor = .black
        
        return cell
    }
    
    
}
