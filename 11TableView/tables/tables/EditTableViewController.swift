//
//  EditTableViewController.swift
//  tables
//
//  Created by ravebizz on 1/27/22.
//

import UIKit

class EditTableViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var contentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var list: [ToDoItem] = []
    
    /// Passing Data with segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue")
        let tableVC = segue.destination as? ViewController
        list.append(ToDoItem(title: titleTextField.text ?? "", content: contentTextField.text ?? ""))
        let vcs = self.tabBarController?.viewControllers
        if let tableVC = vcs?[1] as? ViewController {
            tableVC.list = list
            tableVC.show(tableVC, sender: self)
            tableVC.tableView.reloadData()
        }
        tableVC?.list = list
        tableVC?.isButtonClick = true
    }

}
