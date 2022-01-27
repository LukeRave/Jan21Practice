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
    var isButtonClick:Bool = false
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func BackClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    var list: [ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(list)
        
        tableView.dataSource = self
        let nib = UINib(nibName: TodoCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TodoCell.identifier)
        if isButtonClick {
            isButtonClick = !isButtonClick
            tableView.reloadData()
        }
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
        cell.contentLabel.text = todoItem.content
        
        cell.backgroundColor = .yellow
        
        return cell
    }
}


