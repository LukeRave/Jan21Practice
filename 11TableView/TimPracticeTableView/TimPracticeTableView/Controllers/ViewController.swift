//
//  ViewController.swift
//  TimPracticeTableView
//
//  Created by ravebizz on 1/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var list: [TodoItem] = [TodoItem(title: "hello", content: "world")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        let nib = UINib(nibName: TodoCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TodoCell.identifier)
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
        
        cell.titleLabel?.text = todoItem.title
        cell.contentLabel?.text = todoItem.content
        
        cell.backgroundColor = .cyan
        
        return cell
    }
    
    
}

