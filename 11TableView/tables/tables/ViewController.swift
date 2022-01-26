//
//  ViewController.swift
//  tables
//
//  Created by Luat on 1/26/22.
//

import UIKit

/*
 1. Storyboard: create a tableView
 2. Add the outlet
 3. Set tableView.datasource
 4. VC: UITableViewDatasource
 5. Implement numberOfRows and cellForRowAt
 6. Custom Cells:
 - tableView.register(nib, withIdentifier)
 7. tableView.dequeueReusableCell
 
 */

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var list: [ToDoItem] = ToDoManager.createSomeItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(list)
        
        tableView.dataSource = self
        let nib = UINib(nibName: TodoCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TodoCell.identifier)
        something()
    }
    
    func something() {
        list.append(ToDoItem(title: "testing", status: .done))
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.identifier) as? TodoCell else {
            return UITableViewCell()
        }
        
        let todoItem = list[indexPath.row]
        
        cell.titleLabel.text = todoItem.title
        cell.statusLabel.text = todoItem.status.rawValue
        
        cell.backgroundColor = .yellow
        
        return cell
    }
}


