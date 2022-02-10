//
//  ViewController.swift
//  tableViews
//
//  Created by Cameryn Williams on 2/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var list: [ListItem] = listManager.generateItems()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        let nib = UINib(nibName: TableViewCell.identifier, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: TableViewCell.identifier)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell else {
            return UITableViewCell()
        }
        let listItem = list[indexPath.row]
        
        cell.itemNumber.text = String(listItem.number)
        cell.Title.text = listItem.title
        cell.Description.text = listItem.description
        cell.Status.text = listItem.status.rawValue
        cell.backgroundColor = .green
        
        return cell
    }
}
